using McMaster.NETCore.Plugins;
using Microsoft.Extensions.DependencyInjection;
using QLanguageServer.Models;

namespace QLanguageServer;

public class HandlerService : IHandlerService
{
    private readonly IServiceProvider _serviceProvider;
    private readonly PluginLoader _loader;

    public ITextDocumentHandler TextDocumentHandler { get; private set; } = null!;

    public HandlerService(IServiceProvider serviceProvider)
    {
        _serviceProvider = serviceProvider;

        _loader = PluginLoader.CreateFromAssemblyFile(
            Path.GetFullPath(Path.Join(Environment.ProcessPath, "..", "..", "plugins", "KdbLint.dll")),
            new[] { typeof(ITextDocumentHandler) },
            config => config.EnableHotReload = true);
        _loader.Reloaded += (_, _) => SetHandlers();
        SetHandlers();
    }

    private T GetHandler<T>(IEnumerable<Type> types) where T : IHandler
    {
        var type = types.Single(x => typeof(T).IsAssignableFrom(x) && !x.IsAbstract);
        return (T)ActivatorUtilities.CreateInstance(_serviceProvider, type);
    }

    private void SetHandlers()
    {
        var types = _loader.LoadDefaultAssembly().GetTypes();
        TextDocumentHandler = GetHandler<ITextDocumentHandler>(types);
    }
}