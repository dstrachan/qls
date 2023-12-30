using OmniSharp.Extensions.LanguageServer.Protocol.Client.Capabilities;
using OmniSharp.Extensions.LanguageServer.Protocol.Document;
using OmniSharp.Extensions.LanguageServer.Protocol.Models;

namespace QLanguageServer.Handlers;

public class DefinitionHandler(IHandlerService handlerService, TextDocumentSelector textDocumentSelector)
    : DefinitionHandlerBase
{
    protected override DefinitionRegistrationOptions CreateRegistrationOptions(DefinitionCapability capability,
        ClientCapabilities clientCapabilities) => new()
    {
        DocumentSelector = textDocumentSelector,
    };

    public override Task<LocationOrLocationLinks?>
        Handle(DefinitionParams request, CancellationToken cancellationToken) =>
        handlerService.DefinitionHandler.HandleAsync(request, cancellationToken);
}