using MediatR;
using OmniSharp.Extensions.LanguageServer.Protocol.Models;

namespace QLanguageServer.Models;

public interface ITextDocumentSyncHandler : IHandler
{
    public Task<Unit> OnOpenAsync(DidOpenTextDocumentParams request, CancellationToken cancellationToken);
    public Task<Unit> OnChangeAsync(DidChangeTextDocumentParams request, CancellationToken cancellationToken);
    public Task<Unit> OnSaveAsync(DidSaveTextDocumentParams request, CancellationToken cancellationToken);
    public Task<Unit> OnCloseAsync(DidCloseTextDocumentParams request, CancellationToken cancellationToken);
}