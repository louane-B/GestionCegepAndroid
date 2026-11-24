using Android.Content;
using Android.Views;
using GestionCegepMobile.Controleurs;
using GestionCegepMobile.DTOs;
using GestionCegepMobile.Modeles;
using GestionCegepMobile.Utils;

namespace GestionCegepMobile.Vues
{
    /// <summary>
    /// Classe de type Activité pour la gestion d'un Enseignant.
    /// </summary>
    [Activity(Label = "@string/app_name")]
    public class EnseignantDetailsActivity : Activity
    {
        private string paramNomCegep;
        private string paramNomDepartement;
        private int paramNoEmploye;
        private EnseignantDTO enseignant;
        private TextView lblNoEnseignant;
        private TextView lblNomEnseignant;
        private TextView lblPrenomEnseignant;
        private TextView lblAdresseEnseignant;
        private TextView lblVilleEnseignant;
        private TextView lblProvinceEnseignant;
        private TextView lblCodePostalEnseignant;
        private TextView lblTelephoneEnseignant;
        private TextView lblCourrielEnseignant;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.EnseignantDetails_Activity);

            lblNoEnseignant = FindViewById<TextView>(Resource.Id.lblNoEnseignantAfficher);
            lblNomEnseignant = FindViewById<TextView>(Resource.Id.lblNomEnseignantAfficher);
            lblPrenomEnseignant = FindViewById<TextView>(Resource.Id.lblPrenomEnseignantAfficher);
            lblAdresseEnseignant = FindViewById<TextView>(Resource.Id.lblAdresseEnseignantAfficher);
            lblVilleEnseignant = FindViewById<TextView>(Resource.Id.lblVilleEnseignantAfficher);
            lblProvinceEnseignant = FindViewById<TextView>(Resource.Id.lblProvinceEnseignantAfficher);
            lblCodePostalEnseignant = FindViewById<TextView>(Resource.Id.lblCodePostalEnseignantAfficher);
            lblTelephoneEnseignant = FindViewById<TextView>(Resource.Id.lblTelephoneEnseignantAfficher);
            lblCourrielEnseignant = FindViewById<TextView>(Resource.Id.lblCourrielEnseignantAfficher);

            paramNomCegep = Intent.GetStringExtra("paramNomCegep");
            paramNomDepartement = Intent.GetStringExtra("paramNomDepartement");
            paramNoEmploye = Intent.GetIntExtra("paramNoEmploye", paramNoEmploye);
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
                enseignant = CegepControleur.Instance.ObtenirEnseignant(paramNomCegep, paramNomDepartement, new EnseignantDTO(paramNoEmploye, "", "", "", "", "", "", "", ""));

                lblNoEnseignant.Text = enseignant.NoEmploye.ToString();
                lblNomEnseignant.Text = enseignant.Nom;
                lblPrenomEnseignant.Text = enseignant.Prenom;
                lblAdresseEnseignant.Text = enseignant.Adresse;
                lblVilleEnseignant.Text = enseignant.Ville;
                lblProvinceEnseignant.Text = enseignant.Province;
                lblCodePostalEnseignant.Text = enseignant.CodePostal;
                lblTelephoneEnseignant.Text = enseignant.Telephone;
                lblCourrielEnseignant.Text = enseignant.Courriel;
            }
            catch (Exception)
            {
                Finish();
            }
        }

        public override bool OnCreateOptionsMenu(IMenu menu)
        {
            MenuInflater.Inflate(Resource.Menu.EnseignantDetails_ActivityMenu, menu);
            return base.OnCreateOptionsMenu(menu);
        }

        public override bool OnOptionsItemSelected(IMenuItem item)
        {
            switch (item.ItemId)
            {

                case Resource.Id.Modifier:
                    Intent activiteEnseignantModifier = new Intent(this, typeof(EnseignantModifierActivity));
                    activiteEnseignantModifier.PutExtra("paramNomCegep", paramNomCegep);
                    activiteEnseignantModifier.PutExtra("paramNomDepartement", paramNomDepartement);
                    activiteEnseignantModifier.PutExtra("paramNoEmploye", paramNoEmploye);
                    StartActivity(activiteEnseignantModifier);
                    break;

                case Resource.Id.Supprimer:
                    try
                    {
                        DialoguesUtils.AfficherDialogueQuestionOuiNon(this, "Suppression", "Voulez-vous vraiment supprimer l'enseignant ?", (oui) =>
                        {
                            if (oui)
                            {
                                CegepControleur.Instance.SupprimerEnseignant(paramNomCegep, paramNomDepartement, new EnseignantDTO(paramNoEmploye, "", "", "", "", "", "", "", ""));
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

                case Resource.Id.Quitter:
                    Finish();
                    break;
            }
            return base.OnOptionsItemSelected(item);
        }
    }
}
