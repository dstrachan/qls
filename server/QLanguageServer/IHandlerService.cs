using QLanguageServer.Models;

namespace QLanguageServer;

public interface IHandlerService
{
    IDefinitionHandler DefinitionHandler { get; }
    IDocumentFormattingHandler DocumentFormattingHandler { get; }
    IHoverHandler HoverHandler { get; }
    ISemanticTokensHandler SemanticTokensHandler { get; }
    ITextDocumentSyncHandler TextDocumentSyncHandler { get; }
}