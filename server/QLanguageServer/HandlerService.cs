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
            Path.GetFullPath(
                Path.Join(Environment.ProcessPath, "..", "..", "..", "..", "..", "plugins", "TestProject.dll")
            ),
            new[] { typeof(ITextDocumentHandler) },
            config => config.EnableHotReload = true);
        _loader.Reloaded += (_, _) => SetHandlers();
        SetHandlers();
    }

    private T GetHandler<T>() where T : IHandler
    {
        var type = _loader
            .LoadDefaultAssembly()
            .GetTypes()
            .Single(t => typeof(T).IsAssignableFrom(t) && !t.IsAbstract);
        return (T)ActivatorUtilities.CreateInstance(_serviceProvider, type);
    }

    private void SetHandlers()
    {
        TextDocumentHandler = GetHandler<ITextDocumentHandler>();
    }
}