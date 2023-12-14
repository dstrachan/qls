using System.Diagnostics;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using OmniSharp.Extensions.LanguageServer.Protocol.Models;
using OmniSharp.Extensions.LanguageServer.Protocol.Server;
using OmniSharp.Extensions.LanguageServer.Server;
using Serilog;

namespace QLanguageServer;

internal static class Program
{
    public static async Task Main()
    {
        Log.Logger = new LoggerConfiguration()
            .Enrich.FromLogContext()
            .WriteTo.File("log.txt", rollingInterval: RollingInterval.Day)
            .MinimumLevel.Verbose()
            .CreateLogger();

        // while (!Debugger.IsAttached)
        // {
        //     await Task.Delay(1000);
        // }

        var server = await LanguageServer.From(options => options
            .WithInput(Console.OpenStandardInput())
            .WithOutput(Console.OpenStandardOutput())
            .ConfigureLogging(builder => builder
                .AddSerilog(Log.Logger)
                .AddLanguageProtocolLogging()
                .SetMinimumLevel(LogLevel.Debug)
            )
            .WithHandler<TextDocumentSyncHandler>()
            .WithHandler<SemanticTokensHandler>()
            .WithHandler<HoverHandler>()
            .WithServices(services => services
                .AddLogging(builder => builder
                    .SetMinimumLevel(LogLevel.Trace))
                .AddSingleton<IHandlerService, HandlerService>()
                .AddSingleton(new TextDocumentSelector(
                    new TextDocumentFilter
                    {
                        Language = "q",
                    },
                    new TextDocumentFilter
                    {
                        Language = "k",
                    })))
            .OnInitialize(OnInitializeAsync)
            .OnInitialized(OnInitializedAsync)
            .OnStarted(OnStartedAsync)
        ).ConfigureAwait(false);
        await server.WaitForExit.ConfigureAwait(false);
    }

    private static async Task OnInitializeAsync(ILanguageServer languageServer, InitializeParams request,
        CancellationToken cancellationToken)
    {
        await Task.CompletedTask;
    }

    private static async Task OnInitializedAsync(ILanguageServer languageServer, InitializeParams request,
        InitializeResult response, CancellationToken cancellationToken)
    {
        await Task.CompletedTask;
    }

    private static async Task OnStartedAsync(ILanguageServer languageServer, CancellationToken cancellationToken)
    {
        await Task.CompletedTask;
    }
}