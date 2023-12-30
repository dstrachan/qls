using OmniSharp.Extensions.LanguageServer.Protocol.Models;

namespace QLanguageServer.Models;

public interface IDefinitionHandler
{
    Task<LocationOrLocationLinks?> HandleAsync(DefinitionParams request, CancellationToken cancellationToken);
}