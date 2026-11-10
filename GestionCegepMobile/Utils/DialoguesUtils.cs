using Android.Views;

namespace GestionCegepMobile.Utils
{
    public static class DialoguesUtils
    {
        public static void AfficherToasts(Activity sender, string message)
        {
            Toast.MakeText(sender, message, ToastLength.Long).Show();
        }

        public static void AfficherMessageOK(Activity sender, string titre, string message)
        {
            AlertDialog.Builder builder = new AlertDialog.Builder(sender);
            builder.SetPositiveButton("OK", (send, args) => {});
            AlertDialog dialog = builder.Create();
            dialog.SetTitle(titre);
            dialog.SetMessage(message);
            dialog.Show();
        }

        public static void AfficherDialogueQuestionOuiNon(Activity sender, string titre, string question, Action<bool> callback)
        {
            AlertDialog.Builder builder = new AlertDialog.Builder(sender);

            builder.SetPositiveButton("Non", (send, args) =>
            {
                callback(false);
            });

            builder.SetNegativeButton("Oui", (send, args) =>
            {
                callback(true);
            });

            AlertDialog dialog = builder.Create();
            dialog.SetTitle(titre);
            dialog.SetMessage(question);
            dialog.Window.SetGravity(GravityFlags.Bottom);
            dialog.Show();
        }
        
        public static void AfficherDialogueQuestionInput(Activity sender, string titre, string question, Action<string> callback)
        {
            EditText InputText = new EditText(sender);

            AlertDialog.Builder builder = new AlertDialog.Builder(sender);
            builder.SetView(InputText);

            builder.SetPositiveButton("OK", (dialogSender, args) => { callback(InputText.Text); });
            AlertDialog dialog = builder.Create();

            dialog.SetTitle(titre);
            dialog.SetMessage(question);
            dialog.Window.SetGravity(GravityFlags.Bottom);
            dialog.Show();
        }
    }
}