using OmniSharp.Extensions.LanguageServer.Protocol.Client.Capabilities;
using OmniSharp.Extensions.LanguageServer.Protocol.Document;
using OmniSharp.Extensions.LanguageServer.Protocol.Models;

namespace QLanguageServer;

internal class HoverHandler(IHandlerService handlerService, TextDocumentSelector textDocumentSelector)
    : HoverHandlerBase
{
    public override Task<Hover?> Handle(HoverParams request, CancellationToken cancellationToken) =>
        handlerService.HoverHandler.OnHoverAsync(request, cancellationToken);

    protected override HoverRegistrationOptions CreateRegistrationOptions(HoverCapability capability,
        ClientCapabilities clientCapabilities) => new()
    {
        DocumentSelector = textDocumentSelector,
    };
}