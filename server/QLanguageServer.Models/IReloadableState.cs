namespace QLanguageServer.Models;

public interface IReloadableState
{
    public string GetState();
    public void SetState(string json);
}