using MediatR;
using OmniSharp.Extensions.LanguageServer.Protocol.Models;

namespace QLanguageServer.Models;

public interface ITextDocumentHandler : IHandler
{
    public Task<Unit> HandleAsync(DidOpenTextDocumentParams request, CancellationToken cancellationToken);
    public Task<Unit> HandleAsync(DidChangeTextDocumentParams request, CancellationToken cancellationToken);
    public Task<Unit> HandleAsync(DidSaveTextDocumentParams request, CancellationToken cancellationToken);
    public Task<Unit> HandleAsync(DidCloseTextDocumentParams request, CancellationToken cancellationToken);
}