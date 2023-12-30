using OmniSharp.Extensions.LanguageServer.Protocol.Models;

namespace QLanguageServer.Models;

public interface IHoverHandler : IHandler
{
    Task<Hover?> HandleAsync(HoverParams request, CancellationToken cancellationToken);
}