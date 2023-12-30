using OmniSharp.Extensions.LanguageServer.Protocol.Client.Capabilities;
using OmniSharp.Extensions.LanguageServer.Protocol.Document;
using OmniSharp.Extensions.LanguageServer.Protocol.Models;

namespace QLanguageServer.Handlers;

public class HoverHandler(IHandlerService handlerService, TextDocumentSelector textDocumentSelector)
    : HoverHandlerBase
{
    protected override HoverRegistrationOptions CreateRegistrationOptions(HoverCapability capability,
        ClientCapabilities clientCapabilities) => new()
    {
        DocumentSelector = textDocumentSelector,
    };

    public override Task<Hover?> Handle(HoverParams request, CancellationToken cancellationToken) =>
        handlerService.HoverHandler.HandleAsync(request, cancellationToken);
}