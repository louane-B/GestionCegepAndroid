using Microsoft.Data.SqlClient;

/// <summary>
/// Namespace pour les classe de type DAO.
/// </summary>
namespace GestionCegepMobile.DAOs
{
    /// <summary>
    /// Classe représentant un repository.
    /// </summary>
    public class Repository
    {
        #region AttributsPropriete

        /// <summary>
        /// La connexion.
        /// </summary>
        protected SqlConnection connexion;

        #endregion AttributsPropriete

        #region Constructeurs
        /// <summary>
        /// Constructeur de la classe.
        /// </summary>
        protected Repository()
        {
            //connexion = new SqlConnection("Server = tcp:kevthecg.database.windows.net, 1433; Initial Catalog = Cegep; Persist Security Info = False; User ID = kevthecg; Password =UJk565fSdhd8S7; MultipleActiveResultSets = False; Encrypt = True; TrustServerCertificate = False; Connection Timeout = 30;");
            connexion = new SqlConnection(@"Server=tcp:192.168.43.171,1433;Initial Catalog=CegepExamen; User ID=louane;Password=h@riboRDL2025;Encrypt=False;TrustServerCertificate=True");
        }

        #endregion Constructeurs

        #region MethodesService

        /// <summary>
        /// Méthode permettant d'ouvrir la connexion.
        /// </summary>
        protected void OuvrirConnexion()
        {
            connexion.Open();
        }

        /// <summary>
        /// Méthode permettant de fermer la connexion.
        /// </summary>
        protected void FermerConnexion()
        {
            connexion.Close();
        }

        #endregion MethodesService
    }
}
