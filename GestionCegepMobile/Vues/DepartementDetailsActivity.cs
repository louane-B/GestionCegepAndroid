using Android.Content;
using Android.Views;
using GestionCegepMobile.Controleurs;
using GestionCegepMobile.DTOs;
using GestionCegepMobile.Utils;

namespace GestionCegepMobile.Vues
{
    [Activity(Label = "@string/app_name")]
    public class DepartementDetailsActivity : Activity
    {
        private string paramNomCegep;
        private string paramNomDepartement;
        private DepartementDTO leDepartement;
        private TextView lblNomDepartement;
        private TextView lblNoDepartement;
        private TextView lblDescriptionDepartement;
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.DepartementDetails_Activity);

            lblNomDepartement = FindViewById<TextView>(Resource.Id.lblNomDepartementAfficher);
            lblNoDepartement = FindViewById<TextView>(Resource.Id.lblNoDepartementAfficher);
            lblDescriptionDepartement = FindViewById<TextView>(Resource.Id.lblDescriptionDepartementAfficher);

            paramNomDepartement = Intent.GetStringExtra("paramNomDepartement");
            paramNomCegep = Intent.GetStringExtra("paramNomCegep");
        }

        protected override void OnResume()
        {
            base.OnResume();

            RafraichirInterfaceDonnees();
        }

        private void RafraichirInterfaceDonnees()
        {
            try
            {
                leDepartement = CegepControleur.Instance.ObtenirDepartement(paramNomCegep, paramNomDepartement);

                lblNomDepartement.Text = leDepartement.Nom;
                lblNoDepartement.Text = leDepartement.No;
                lblDescriptionDepartement.Text = leDepartement.Description;

            }
            catch (Exception)
            {
                Finish();
            }
        }

        public override bool OnCreateOptionsMenu(IMenu menu)
        {
            MenuInflater.Inflate(Resource.Menu.DepartementDetails_ActivityMenu, menu);
            return base.OnCreateOptionsMenu(menu);
        }

        public override bool OnOptionsItemSelected(IMenuItem item)
        {
            switch (item.ItemId)
            {
                case Resource.Id.Enseignants:
                    Intent activiteEnseignant = new Intent(this, typeof(EnseignantActivity));
                    activiteEnseignant.PutExtra("paramNomCegep", paramNomCegep);
                    activiteEnseignant.PutExtra("paramNomDepartement", paramNomDepartement);
                    StartActivity(activiteEnseignant);
                    break;

                case Resource.Id.Supprimer:
                    try
                    {
                        DialoguesUtils.AfficherDialogueQuestionOuiNon(this, "Suppression", "Voulez-vous supprimer le Département ?", (oui) =>
                        {
                            if (oui)
                            {
                                CegepControleur.Instance.SupprimerDepartement(paramNomCegep, paramNomDepartement);
                                Finish();
                            }
                        });
                    }
                    catch (Exception ex)
                    {
                        DialoguesUtils.AfficherMessageOK(this, "Erreur", ex.Message);
                    }
                    break;

                case Resource.Id.Retour:
                    Finish();
                    break;
            }
            return base.OnOptionsItemSelected(item);
        }
    }
}
