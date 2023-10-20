using OmniSharp.Extensions.LanguageServer.Protocol.Client.Capabilities;
using OmniSharp.Extensions.LanguageServer.Protocol.Document;
using OmniSharp.Extensions.LanguageServer.Protocol.Models;

namespace QLanguageServer;

internal class SemanticTokensHandler : SemanticTokensHandlerBase
{
    private readonly IHandlerService _handlerService;
    private readonly TextDocumentSelector _textDocumentSelector;

    public SemanticTokensHandler(IHandlerService handlerService, TextDocumentSelector textDocumentSelector)
    {
        _handlerService = handlerService;
        _textDocumentSelector = textDocumentSelector;
    }

    protected override SemanticTokensRegistrationOptions CreateRegistrationOptions(SemanticTokensCapability capability,
        ClientCapabilities clientCapabilities)
    {
        return new SemanticTokensRegistrationOptions
        {
            Full = true,
            Range = true,
            DocumentSelector = _textDocumentSelector,
            Legend = new SemanticTokensLegend
            {
                TokenTypes = new Container<SemanticTokenType>(SemanticTokenType.Comment),
            },
        };
    }

    protected override async Task Tokenize(SemanticTokensBuilder builder, ITextDocumentIdentifierParams identifier,
        CancellationToken cancellationToken) =>
        await _handlerService.SemanticTokensHandler.TokenizeAsync(builder, identifier, cancellationToken);

    protected override Task<SemanticTokensDocument> GetSemanticTokensDocument(
        ITextDocumentIdentifierParams @params, CancellationToken cancellationToken) => Task.FromResult(
        new SemanticTokensDocument(new SemanticTokensLegend
        {
            TokenTypes = new Container<SemanticTokenType>(SemanticTokenType.Comment),
        }));
}