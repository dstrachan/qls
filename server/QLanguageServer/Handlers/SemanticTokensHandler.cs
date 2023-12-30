using OmniSharp.Extensions.LanguageServer.Protocol.Client.Capabilities;
using OmniSharp.Extensions.LanguageServer.Protocol.Document;
using OmniSharp.Extensions.LanguageServer.Protocol.Models;

namespace QLanguageServer.Handlers;

public class SemanticTokensHandler(IHandlerService handlerService, TextDocumentSelector textDocumentSelector)
    : SemanticTokensHandlerBase
{
    protected override SemanticTokensRegistrationOptions CreateRegistrationOptions(SemanticTokensCapability capability,
        ClientCapabilities clientCapabilities) => new()
    {
        Full = true,
        Range = true,
        DocumentSelector = textDocumentSelector,
        Legend = new SemanticTokensLegend
        {
            TokenTypes = new Container<SemanticTokenType>(SemanticTokenType.Comment),
        },
    };

    protected override Task Tokenize(SemanticTokensBuilder builder, ITextDocumentIdentifierParams identifier,
        CancellationToken cancellationToken) =>
        handlerService.SemanticTokensHandler.TokenizeAsync(builder, identifier, cancellationToken);

    protected override Task<SemanticTokensDocument> GetSemanticTokensDocument(ITextDocumentIdentifierParams @params,
        CancellationToken cancellationToken) => Task.FromResult(new SemanticTokensDocument(new SemanticTokensLegend
    {
        TokenTypes = new Container<SemanticTokenType>(SemanticTokenType.Comment),
    }));
}