using QLanguageServer.Models;

namespace QLanguageServer;

public interface IHandlerService
{
    ITextDocumentHandler TextDocumentHandler { get; }
}