using OmniSharp.Extensions.LanguageServer.Protocol.Models;

namespace QLanguageServer.Models;

public interface IDocumentFormattingHandler
{
    Task<TextEditContainer?> HandleAsync(DocumentFormattingParams request, CancellationToken cancellationToken);
}