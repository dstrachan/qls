using QLanguageServer.Models;

namespace QLanguageServer;

internal interface IHandlerService
{
    ITextDocumentSyncHandler TextDocumentSyncHandler { get; }
    ISemanticTokensHandler SemanticTokensHandler { get; }
    IHoverHandler HoverHandler { get; }
}