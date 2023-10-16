using System.Text.RegularExpressions;
using MediatR;
using OmniSharp.Extensions.LanguageServer.Protocol.Document;
using OmniSharp.Extensions.LanguageServer.Protocol.Models;
using OmniSharp.Extensions.LanguageServer.Protocol.Server;
using QLanguageServer.Models;

namespace TestProject;

public partial class TextDocumentHandler : ITextDocumentHandler
{
    private readonly ILanguageServerFacade _languageServerFacade;

    private readonly TextDocumentIndexer _textDocumentIndexer;

    public TextDocumentHandler(ILanguageServerFacade languageServerFacade)
    {
        _languageServerFacade = languageServerFacade;

        _textDocumentIndexer = new TextDocumentIndexer();
    }

    public Task<Unit> HandleAsync(DidOpenTextDocumentParams request, CancellationToken cancellationToken)
    {
        ValidateFile(request.TextDocument, request.TextDocument.Text);
        return Unit.Task;
    }

    private void ValidateFile(TextDocumentIdentifier identifier, string text)
    {
        _textDocumentIndexer.IndexFile(identifier, text);
        var matches = UppercaseRegex().Matches(text);
        if (matches.Count == 0) return;

        var diagnostics = new List<Diagnostic>();
        foreach (Match match in matches)
        {
            var range = _textDocumentIndexer.GetRange(identifier, match.Index, match.Index + match.Length);
            var location = new Location
            {
                Uri = identifier.Uri,
                Range = range,
            };
            var diagnostic = new Diagnostic
            {
                Severity = DiagnosticSeverity.Warning,
                Range = range,
                Message = $"{match.Groups[0]} is all uppercase.",
                Source = "ex",
                RelatedInformation = new Container<DiagnosticRelatedInformation>(
                    new DiagnosticRelatedInformation
                    {
                        Location = location,
                        Message = "Spelling matters",
                    },
                    new DiagnosticRelatedInformation
                    {
                        Location = location,
                        Message = "Particularly for names",
                    }
                ),
            };
            diagnostics.Add(diagnostic);
        }

        _languageServerFacade.TextDocument.PublishDiagnostics(new PublishDiagnosticsParams
        {
            Diagnostics = new Container<Diagnostic>(diagnostics),
            Uri = identifier.Uri,
        });
    }

    public Task<Unit> HandleAsync(DidChangeTextDocumentParams request, CancellationToken cancellationToken)
    {
        foreach (var change in request.ContentChanges)
        {
            ValidateFile(request.TextDocument, change.Text);
        }

        return Unit.Task;
    }

    public Task<Unit> HandleAsync(DidSaveTextDocumentParams request, CancellationToken cancellationToken)
    {
        return Unit.Task;
    }

    public Task<Unit> HandleAsync(DidCloseTextDocumentParams request, CancellationToken cancellationToken)
    {
        return Unit.Task;
    }

    [GeneratedRegex(@"\b[A-Z]{2,}\b")]
    private static partial Regex UppercaseRegex();
}