using Android.Content;
using Android.Views;
using GestionCegepMobile.Adapteurs;
using GestionCegepMobile.Controleurs;
using GestionCegepMobile.DTOs;
using GestionCegepMobile.Utils;

/// <summary>
/// Namespace pour les classes de type Vue.
/// </summary>
namespace GestionCegepMobile.Vues
{
    /// <summary>
    /// Classe de type Activité pour la gestion d'un Cégep.
    /// </summary>
    [Activity(Label = "@string/app_name")]
    public class CegepDetailsActivity : Activity
    {
        /// <summary>
        /// Attribut représentant le paramètre reçu de l'activité précédente.
        /// </summary>
        private string paramNomCegep;

        /// <summary>
        /// Attribut représentant le DTO du Cégep.
        /// </summary>
        private CegepDTO leCegep;

        private DepartementDTO[] listeDepartement;
        private ListeDepartementAdapter adapteurListeDepartement;

        /// <summary>
        /// Attribut représentant l'étiquette pour l'affichage du nom du Cégep.
        /// </summary>
        private TextView lblNomCegepAfficher;

        /// <summary>
        /// Attribut représentant l'étiquette pour l'affichage de l'adresse du Cégep.
        /// </summary>
        private TextView lblAdresseCegepAfficher;

        /// <summary>
        /// Attribut représentant l'étiquette pour l'affichage de la ville du Cégep.
        /// </summary>
        private TextView lblVilleCegepAfficher;

        /// <summary>
        /// Attribut représentant l'étiquette pour l'affichage de la province du Cégep.
        /// </summary>
        private TextView lblProvinceCegepAfficher;

        /// <summary>
        /// Attribut représentant l'étiquette pour l'affichage du code postal du Cégep.
        /// </summary>
        private TextView lblCodePostalCegepAfficher;

        /// <summary>
        /// Attribut représentant l'étiquette pour l'affichage du téléphone du Cégep.
        /// </summary>
        private TextView lblTelephoneCegepAfficher;

        /// <summary>
        /// Attribut représentant l'étiquette pour l'affichage du courriel du Cégep.
        /// </summary>
        private TextView lblCourrielCegepAfficher;

        private ListView listViewDepartement;
        private EditText edtNomDepartement;
        private EditText edtNoDepartement;
        private EditText edtDescriptionDepartement;
        private Button btnAjouterDepartement;

        /// <summary>
        /// Méthode de service appelée lors de la création de l'activité.
        /// </summary>
        /// <param name="savedInstanceState">État de l'activité.</param>
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.CegepDetails_Activity);

            lblNomCegepAfficher = FindViewById<TextView>(Resource.Id.lblNomAfficher);
            lblAdresseCegepAfficher = FindViewById<TextView>(Resource.Id.lblAdresseAfficher);
            lblVilleCegepAfficher = FindViewById<TextView>(Resource.Id.lblVilleAfficher);
            lblProvinceCegepAfficher = FindViewById<TextView>(Resource.Id.lblProvinceAfficher);
            lblCodePostalCegepAfficher = FindViewById<TextView>(Resource.Id.lblCodePostalAfficher);
            lblTelephoneCegepAfficher = FindViewById<TextView>(Resource.Id.lblTelephoneAfficher);
            lblCourrielCegepAfficher = FindViewById<TextView>(Resource.Id.lblCourrielAfficher);

            paramNomCegep = Intent.GetStringExtra("paramNomCegep");

            listViewDepartement = FindViewById<ListView>(Resource.Id.listViewDepartementAfficher);
            listViewDepartement.ItemClick += (sender, e) =>
            {
                Intent activiteDepartementDetails = new Intent(this, typeof(DepartementDetailsActivity));
                activiteDepartementDetails.PutExtra("paramNomDepartement", listeDepartement[e.Position].Nom);
                activiteDepartementDetails.PutExtra("paramNomCegep", paramNomCegep);
                StartActivity(activiteDepartementDetails);
            };

            edtNoDepartement = FindViewById<EditText>(Resource.Id.edtNoDepartementInfo);
            edtNomDepartement = FindViewById<EditText>(Resource.Id.edtNomDepartementInfo);
            edtDescriptionDepartement = FindViewById<EditText>(Resource.Id.edtDescriptionDepartementInfo);

            btnAjouterDepartement = FindViewById<Button>(Resource.Id.btnAjouter);
            btnAjouterDepartement.Click += delegate
            {
                if (edtNoDepartement.Text.Length > 0 && edtNomDepartement.Text.Length > 0 && edtDescriptionDepartement.Text.Length > 0)
                {
                    try
                    {
                        string no = edtNoDepartement.Text;
                        string nom = edtNomDepartement.Text;
                        CegepControleur.Instance.AjouterDepartement(paramNomCegep, new DepartementDTO(edtNoDepartement.Text, edtNomDepartement.Text, edtDescriptionDepartement.Text));
                        RafraichirInterfaceDonnees();
                        DialoguesUtils.AfficherToasts(this, no + " " + nom + " ajouté !!!");
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

        /// <summary>
        /// Méthode de service appelée lors du retour en avant plan de l'activité.
        /// </summary>
        protected override void OnResume()
        {
            base.OnResume();

            RafraichirInterfaceDonnees();
        }

        /// <summary>
        /// Méthode permettant de rafraichir les informations du Cégep...
        /// </summary>
        private void RafraichirInterfaceDonnees()
        {
            try
            {
                // Rafraichir les information du cegep...
                leCegep = CegepControleur.Instance.ObtenirCegep(paramNomCegep);

                lblNomCegepAfficher.Text = leCegep.Nom;
                lblAdresseCegepAfficher.Text = leCegep.Adresse;
                lblVilleCegepAfficher.Text = leCegep.Ville;
                lblProvinceCegepAfficher.Text = leCegep.Province;
                lblCodePostalCegepAfficher.Text = leCegep.CodePostal;
                lblTelephoneCegepAfficher.Text = leCegep.Telephone;
                lblCourrielCegepAfficher.Text = leCegep.Courriel;

                //Rafraichir la liste des Departements...
                listeDepartement = CegepControleur.Instance.ObtenirListeDepartement(paramNomCegep).ToArray();

                adapteurListeDepartement = new ListeDepartementAdapter(this, listeDepartement);
                listViewDepartement.Adapter = adapteurListeDepartement;
                edtNoDepartement.Text = edtNomDepartement.Text = edtDescriptionDepartement.Text = "";
                edtNoDepartement.RequestFocus();
            }
            catch (Exception)
            {
                Finish();
            }
        }

        
        /// <summary>Méthode de service permettant d'initialiser le menu de l'activité principale.</summary>
        /// <param name="menu">Le menu à construire.</param>
        /// <returns>Retourne True si l'optionMenu est bien créé.</returns>
        public override bool OnCreateOptionsMenu(IMenu menu)
        {
            MenuInflater.Inflate(Resource.Menu.CegepDetails_ActivityMenu, menu);
            return base.OnCreateOptionsMenu(menu);
        }

        /// <summary>Méthode de service permettant de capter l'évenement exécuté lors d'un choix dans le menu.</summary>
        /// <param name="item">L'item sélectionné.</param>
        /// <returns>Retourne si un option à été sélectionné avec succès.</returns>
        public override bool OnOptionsItemSelected(IMenuItem item)
        {
            switch (item.ItemId)
            {
                case Resource.Id.Modifier:
                    Intent activiteModifier = new Intent(this, typeof(CegepModifierActivity));
                    activiteModifier.PutExtra("paramNomCegep", leCegep.Nom);
                    StartActivity(activiteModifier);
                    break;

                case Resource.Id.Supprimer:
                    try
                    {
                        DialoguesUtils.AfficherDialogueQuestionOuiNon(this, "Suppression", "Voulez-vous vraiment supprimer le Cégep ?", (oui) =>
                        {
                            if (oui)
                            {
                                CegepControleur.Instance.SupprimerCegep(leCegep.Nom);
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