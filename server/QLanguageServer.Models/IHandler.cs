namespace QLanguageServer.Models;

public interface IHandler
{
    public string GetState();
    public void SetState(string json);
}