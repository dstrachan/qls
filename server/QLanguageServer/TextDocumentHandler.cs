using System.Diagnostics;
using System.Text.RegularExpressions;
using MediatR;
using OmniSharp.Extensions.LanguageServer.Protocol;
using OmniSharp.Extensions.LanguageServer.Protocol.Client.Capabilities;
using OmniSharp.Extensions.LanguageServer.Protocol.Document;
using OmniSharp.Extensions.LanguageServer.Protocol.Models;
using OmniSharp.Extensions.LanguageServer.Protocol.Server;
using OmniSharp.Extensions.LanguageServer.Protocol.Server.Capabilities;

namespace QLanguageServer;

internal partial class TextDocumentHandler : TextDocumentSyncHandlerBase
{
    private readonly ILanguageServerFacade _languageServerFacade;

    private readonly TextDocumentSelector _textDocumentSelector = new(
        new TextDocumentFilter
        {
            Language = "q",
        },
        new TextDocumentFilter
        {
            Language = "k",
        });

    public TextDocumentHandler(ILanguageServerFacade languageServerFacade)
    {
        _languageServerFacade = languageServerFacade;
    }

    public override TextDocumentAttributes GetTextDocumentAttributes(DocumentUri uri)
    {
        var languageId = Path.GetExtension(uri.Path) switch
        {
            ".q" => "q",
            ".k" => "k",
            _ => throw new UnreachableException(),
        };
        return new TextDocumentAttributes(uri, languageId);
    }

    public override Task<Unit> Handle(DidOpenTextDocumentParams request, CancellationToken cancellationToken)
    {
        return Unit.Task;
    }

    public override Task<Unit> Handle(DidChangeTextDocumentParams request, CancellationToken cancellationToken)
    {
        return Unit.Task;
    }

    public override Task<Unit> Handle(DidSaveTextDocumentParams request, CancellationToken cancellationToken)
    {
        return Unit.Task;
    }

    public override Task<Unit> Handle(DidCloseTextDocumentParams request, CancellationToken cancellationToken)
    {
        return Unit.Task;
    }

    protected override TextDocumentSyncRegistrationOptions CreateRegistrationOptions(
        TextSynchronizationCapability capability, ClientCapabilities clientCapabilities)
    {
        return new TextDocumentSyncRegistrationOptions
        {
            Change = TextDocumentSyncKind.Full,
            Save = new SaveOptions { IncludeText = true },
            DocumentSelector = _textDocumentSelector,
        };
    }

  [GeneratedRegex(@"\b[A-Z]{2,}\b")]
  private static partial Regex UppercaseRegex();
}