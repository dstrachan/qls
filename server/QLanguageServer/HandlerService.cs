using McMaster.NETCore.Plugins;
using Microsoft.Extensions.DependencyInjection;
using QLanguageServer.Models;

namespace QLanguageServer;

internal class HandlerService : IHandlerService
{
    private readonly IServiceProvider _serviceProvider;
    private readonly PluginLoader _loader;

    private IReloadableState? _state;

    public ITextDocumentSyncHandler TextDocumentSyncHandler { get; private set; } = null!;
    public ISemanticTokensHandler SemanticTokensHandler { get; private set; } = null!;
    public IHoverHandler HoverHandler { get; private set; } = null!;

    public HandlerService(IServiceProvider serviceProvider)
    {
        _serviceProvider = serviceProvider;

        _loader = PluginLoader.CreateFromAssemblyFile(
            Path.GetFullPath(Path.Join(Environment.ProcessPath, "..", "..", "plugins", "KdbLint.dll")),
            new[] { typeof(ITextDocumentSyncHandler), typeof(ISemanticTokensHandler), typeof(IHoverHandler) },
            config => config.EnableHotReload = true);
        _loader.Reloaded += (_, _) => SetHandlers();
        SetHandlers();
    }

    private T CreateInstance<T>(IEnumerable<Type> types)
    {
        var type = types.Single(x => typeof(T).IsAssignableFrom(x) && !x.IsAbstract);
        return (T)ActivatorUtilities.CreateInstance(_serviceProvider, type);
    }

    private void SetHandlers()
    {
        var types = _loader.LoadDefaultAssembly().GetTypes();

        var oldState = _state;
        _state = CreateInstance<IReloadableState>(types);
        if (oldState != null)
        {
            _state.SetState(oldState.GetState());
        }

        TextDocumentSyncHandler = CreateInstance<ITextDocumentSyncHandler>(types);
        SemanticTokensHandler = CreateInstance<ISemanticTokensHandler>(types);
        HoverHandler = CreateInstance<IHoverHandler>(types);
    }
}