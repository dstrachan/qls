using OmniSharp.Extensions.LanguageServer.Protocol.Client.Capabilities;
using OmniSharp.Extensions.LanguageServer.Protocol.Document;
using OmniSharp.Extensions.LanguageServer.Protocol.Models;

namespace QLanguageServer.Handlers;

public class DocumentFormattingHandler(IHandlerService handlerService, TextDocumentSelector textDocumentSelector)
    : DocumentFormattingHandlerBase
{
    protected override DocumentFormattingRegistrationOptions CreateRegistrationOptions(
        DocumentFormattingCapability capability, ClientCapabilities clientCapabilities) => new()
    {
        DocumentSelector = textDocumentSelector,
    };

    public override Task<TextEditContainer?> Handle(DocumentFormattingParams request,
        CancellationToken cancellationToken) =>
        handlerService.DocumentFormattingHandler.HandleAsync(request, cancellationToken);
}