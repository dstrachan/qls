using System.Diagnostics;
using MediatR;
using OmniSharp.Extensions.LanguageServer.Protocol;
using OmniSharp.Extensions.LanguageServer.Protocol.Client.Capabilities;
using OmniSharp.Extensions.LanguageServer.Protocol.Document;
using OmniSharp.Extensions.LanguageServer.Protocol.Models;
using OmniSharp.Extensions.LanguageServer.Protocol.Server.Capabilities;

namespace QLanguageServer;

internal class TextDocumentSyncHandler : TextDocumentSyncHandlerBase
{
    private readonly IHandlerService _handlerService;
    private readonly TextDocumentSelector _textDocumentSelector;

    public TextDocumentSyncHandler(IHandlerService handlerService, TextDocumentSelector textDocumentSelector)
    {
        _handlerService = handlerService;
        _textDocumentSelector = textDocumentSelector;
    }

    public override TextDocumentAttributes GetTextDocumentAttributes(DocumentUri uri)
    {
        var languageId = Path.GetExtension(uri.Path) switch
        {
            ".q" => "q",
            ".k" => "k",
            _ => throw new UnreachableException(),
        };
        return new TextDocumentAttributes(uri, languageId);
    }

    public override async Task<Unit> Handle(DidOpenTextDocumentParams request, CancellationToken cancellationToken) =>
        await _handlerService.TextDocumentSyncHandler.OnOpenAsync(request, cancellationToken);

    public override async Task<Unit> Handle(DidChangeTextDocumentParams request, CancellationToken cancellationToken) =>
        await _handlerService.TextDocumentSyncHandler.OnChangeAsync(request, cancellationToken);

    public override async Task<Unit> Handle(DidSaveTextDocumentParams request, CancellationToken cancellationToken) =>
        await _handlerService.TextDocumentSyncHandler.OnSaveAsync(request, cancellationToken);

    public override async Task<Unit> Handle(DidCloseTextDocumentParams request, CancellationToken cancellationToken) =>
        await _handlerService.TextDocumentSyncHandler.OnCloseAsync(request, cancellationToken);

    protected override TextDocumentSyncRegistrationOptions CreateRegistrationOptions(
        TextSynchronizationCapability capability, ClientCapabilities clientCapabilities) => new()
    {
        Change = TextDocumentSyncKind.Incremental,
        Save = new SaveOptions { IncludeText = true },
        DocumentSelector = _textDocumentSelector,
    };
}