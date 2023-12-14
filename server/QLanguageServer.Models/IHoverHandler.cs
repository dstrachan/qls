using OmniSharp.Extensions.LanguageServer.Protocol.Models;

namespace QLanguageServer.Models;

public interface IHoverHandler : IHandler
{
    Task<Hover?> OnHoverAsync(HoverParams request, CancellationToken cancellationToken);
}