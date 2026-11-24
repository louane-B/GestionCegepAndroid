using GestionCegepMobile.Controleurs;
using GestionCegepMobile.DTOs;

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
        private int paramNoEmployer;
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
            paramNoEmployer = Intent.GetIntExtra("paramNoEmployer", 0);
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
                EnseignantDTO enseignantDTO = new EnseignantDTO(paramNoEmployer, "", "", "", "", "", "", "", "");
                enseignant = CegepControleur.Instance.ObtenirEnseignant(paramNomCegep, paramNomDepartement, enseignantDTO);

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
    }
}
