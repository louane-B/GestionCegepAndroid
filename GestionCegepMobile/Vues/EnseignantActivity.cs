using GestionCegepMobile.Adapteurs;
using GestionCegepMobile.Controleurs;
using GestionCegepMobile.DTOs;
using GestionCegepMobile.Utils;

namespace GestionCegepMobile.Vues
{
    /// <summary>
    /// Classe de type Activité pour l'affichage des Enseignant et l'ajout d'un Enseignant.
    /// </summary>
    [Activity(Label = "@string/app_name", MainLauncher = true)]
    public class EnseignantActivity : Activity
    {
        private string paramNomCegep;
        private string paramNomDepartement;
        private EnseignantDTO[] listeEnseignant;

        private ListeEnseignantAdapter adapteurListeEnseignant;
        private EditText edtNoEnseignant;
        private EditText edtNomEnseignant;
        private EditText edtPrenomEnseignant;
        private EditText edtAdresseEnseignant;
        private EditText edtVilleEnseignant;
        private EditText edtProvinceEnseignant;
        private EditText edtCodePostalEnseignant;
        private EditText edtTelephoneEnseignant;
        private EditText edtCourrielEnseignant;
        private Button btnAjouterEnseignant;
        private ListView listViewEnseignant;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.Enseignant_Activity);

            listViewEnseignant = FindViewById<ListView>(Resource.Id.listViewEnseignant);
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
                listeEnseignant = CegepControleur.Instance.ObtenirListeEnseignant(paramNomCegep, paramNomDepartement).ToArray();
                adapteurListeEnseignant = new ListeEnseignantAdapter(this, listeEnseignant);
                listViewEnseignant.Adapter = adapteurListeEnseignant;
                edtNomEnseignant.Text = edtAdresseEnseignant.Text = edtVilleEnseignant.Text = edtProvinceEnseignant.Text = edtCodePostalEnseignant.Text = edtTelephoneEnseignant.Text = edtCourrielEnseignant.Text = "";
                edtNomEnseignant.RequestFocus();
            }
            catch (Exception ex)
            {
                DialoguesUtils.AfficherMessageOK(this, "Erreur", ex.Message);
            }
        }
    }
}
