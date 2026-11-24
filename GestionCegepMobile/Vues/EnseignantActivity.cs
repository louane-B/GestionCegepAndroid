using Android.Content;
using Android.Views;
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

            edtNoEnseignant = FindViewById<EditText>(Resource.Id.edtNoInfo);
            edtNomEnseignant = FindViewById<EditText>(Resource.Id.edtNomInfo);
            edtPrenomEnseignant = FindViewById<EditText>(Resource.Id.edtPrenomInfo);
            edtAdresseEnseignant = FindViewById<EditText>(Resource.Id.edtAdresseInfo);
            edtVilleEnseignant = FindViewById<EditText>(Resource.Id.edtVilleInfo);
            edtProvinceEnseignant = FindViewById<EditText>(Resource.Id.edtProvinceInfo);
            edtCodePostalEnseignant = FindViewById<EditText>(Resource.Id.edtCodePostalInfo);
            edtTelephoneEnseignant = FindViewById<EditText>(Resource.Id.edtTelephoneInfo);
            edtCourrielEnseignant = FindViewById<EditText>(Resource.Id.edtCourrielInfo);

            paramNomDepartement = Intent.GetStringExtra("paramNomDepartement");
            paramNomCegep = Intent.GetStringExtra("paramNomCegep");

            listViewEnseignant = FindViewById<ListView>(Resource.Id.listViewEnseignant);
            listViewEnseignant.ItemClick += (sender, e) =>
            {
                Intent activiteEnseignantDetails = new Intent(this, typeof(EnseignantDetailsActivity));
                activiteEnseignantDetails.PutExtra("paramNomCegep", paramNomCegep);
                activiteEnseignantDetails.PutExtra("paramNomDepartement", paramNomDepartement);
                activiteEnseignantDetails.PutExtra("paramNoEmploye", listeEnseignant[e.Position].NoEmploye);
                StartActivity(activiteEnseignantDetails);
            };

            btnAjouterEnseignant = FindViewById<Button>(Resource.Id.btnAjouter);
            btnAjouterEnseignant.Click += delegate
            {
                if (edtNoEnseignant.Text.Length > 0 && edtNomEnseignant.Text.Length > 0 && edtPrenomEnseignant.Text.Length > 0 && edtAdresseEnseignant.Text.Length > 0 && edtVilleEnseignant.Text.Length > 0 && edtProvinceEnseignant.Text.Length > 0 && edtCodePostalEnseignant.Text.Length > 0 && edtTelephoneEnseignant.Text.Length > 0 && edtCourrielEnseignant.Text.Length > 0)
                {
                    try
                    {
                        string nom = edtNomEnseignant.Text;
                        string prenom = edtPrenomEnseignant.Text;
                        CegepControleur.Instance.AjouterEnseignant(paramNomCegep, paramNomDepartement, new EnseignantDTO(int.Parse(edtNoEnseignant.Text), edtNomEnseignant.Text, edtPrenomEnseignant.Text, edtAdresseEnseignant.Text, edtVilleEnseignant.Text, edtProvinceEnseignant.Text, edtCodePostalEnseignant.Text, edtTelephoneEnseignant.Text, edtCourrielEnseignant.Text));
                        RafraichirInterfaceDonnees();
                        DialoguesUtils.AfficherToasts(this, prenom + " " + nom + " ajouté !!!");
                    }
                    catch (Exception ex)
                    {
                        DialoguesUtils.AfficherMessageOK(this, "Erreur", ex.Message);
                    }
                }
                else
                    DialoguesUtils.AfficherMessageOK(this, "Erreur", "Veuillez remplir tous les champs...");
            };
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
                edtNoEnseignant.Text = edtNomEnseignant.Text = edtPrenomEnseignant.Text = edtAdresseEnseignant.Text = edtVilleEnseignant.Text = edtProvinceEnseignant.Text = edtCodePostalEnseignant.Text = edtTelephoneEnseignant.Text = edtCourrielEnseignant.Text = "";
                edtNomEnseignant.RequestFocus();
            }
            catch (Exception ex)
            {
                DialoguesUtils.AfficherMessageOK(this, "Erreur", ex.Message);
            }
        }

        public override bool OnCreateOptionsMenu(IMenu menu)
        {
            MenuInflater.Inflate(Resource.Menu.Enseignant_ActivityMenu, menu);
            return base.OnCreateOptionsMenu(menu);
        }

        public override bool OnOptionsItemSelected(IMenuItem item)
        {
            switch (item.ItemId)
            {
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
