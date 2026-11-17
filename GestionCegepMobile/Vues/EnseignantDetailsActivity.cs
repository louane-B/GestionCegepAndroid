

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
        private TextView lblCourruelEnseignant;
    }
}
