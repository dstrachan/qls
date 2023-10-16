using OmniSharp.Extensions.LanguageServer.Protocol;
using OmniSharp.Extensions.LanguageServer.Protocol.Models;
using Range = OmniSharp.Extensions.LanguageServer.Protocol.Models.Range;

namespace TestProject;

public class TextDocumentIndexer
{
    private readonly Dictionary<DocumentUri, int[]> _lineIndices = new();

    public void IndexFile(TextDocumentIdentifier identifier, string text)
    {
        var indices = new List<int>();
        for (var i = 0; i < text.Length; ++i)
        {
            if (text[i] == '\n') indices.Add(i);
        }

        _lineIndices[identifier.Uri] = indices.ToArray();
    }

    public Position GetPosition(TextDocumentIdentifier identifier, int charIndex)
    {
        if (!_lineIndices.TryGetValue(identifier.Uri, out var newlineIndices)) return new Position();

        var prevLineIndex = 0;
        for (var i = 0; i < newlineIndices.Length; ++i)
        {
            if (charIndex <= newlineIndices[i]) return new Position(i, charIndex - prevLineIndex);
            prevLineIndex = newlineIndices[i] + 1;
        }

        return new Position();
    }

    public Range GetRange(TextDocumentIdentifier identifier, int startIndex, int endIndex) => new()
    {
        Start = GetPosition(identifier, startIndex),
        End = GetPosition(identifier, endIndex),
    };
}