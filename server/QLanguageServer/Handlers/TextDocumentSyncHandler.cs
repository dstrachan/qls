using System.Diagnostics;
using MediatR;
using OmniSharp.Extensions.LanguageServer.Protocol;
using OmniSharp.Extensions.LanguageServer.Protocol.Client.Capabilities;
using OmniSharp.Extensions.LanguageServer.Protocol.Document;
using OmniSharp.Extensions.LanguageServer.Protocol.Models;
using OmniSharp.Extensions.LanguageServer.Protocol.Server.Capabilities;

namespace QLanguageServer.Handlers;

public class TextDocumentSyncHandler(IHandlerService handlerService, TextDocumentSelector textDocumentSelector)
    : TextDocumentSyncHandlerBase
{
    public override TextDocumentAttributes GetTextDocumentAttributes(DocumentUri uri) => new(uri,
        Path.GetExtension(uri.Path) switch
        {
            ".q" => "q",
            ".k" => "k",
            _ => throw new UnreachableException(),
        });

    public override Task<Unit> Handle(DidOpenTextDocumentParams request, CancellationToken cancellationToken) =>
        handlerService.TextDocumentSyncHandler.HandleAsync(request, cancellationToken);

    public override Task<Unit> Handle(DidChangeTextDocumentParams request, CancellationToken cancellationToken) =>
        handlerService.TextDocumentSyncHandler.HandleAsync(request, cancellationToken);

    public override Task<Unit> Handle(DidSaveTextDocumentParams request, CancellationToken cancellationToken) =>
        handlerService.TextDocumentSyncHandler.HandleAsync(request, cancellationToken);

    public override Task<Unit> Handle(DidCloseTextDocumentParams request, CancellationToken cancellationToken) =>
        handlerService.TextDocumentSyncHandler.HandleAsync(request, cancellationToken);

    protected override TextDocumentSyncRegistrationOptions CreateRegistrationOptions(
        TextSynchronizationCapability capability, ClientCapabilities clientCapabilities) => new()
    {
        Change = TextDocumentSyncKind.Incremental,
        Save = new SaveOptions { IncludeText = true },
        DocumentSelector = textDocumentSelector,
    };
}