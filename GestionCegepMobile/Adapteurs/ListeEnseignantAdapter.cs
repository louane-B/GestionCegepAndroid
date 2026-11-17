

using Android.Views;
using GestionCegepMobile.DTOs;

namespace GestionCegepMobile.Adapteurs
{
    public class ListeEnseignantAdapter : BaseAdapter<EnseignantDTO>
    {
        private Activity context;
        private EnseignantDTO[] listeEnseignant;

        public ListeEnseignantAdapter(Activity unContext, EnseignantDTO[] uneListeEnseignant)
        {
            context = unContext;
            listeEnseignant = uneListeEnseignant;
        }

        public override EnseignantDTO this[int index] 
        {
            get { return listeEnseignant[index]; }
        }

        public override long GetItemId(int position)
        {
            return position;
        }

        public override int Count
        {
            get { return listeEnseignant.Length; }
        }

        public override View GetView(int position, View convertView, ViewGroup parent)
        {
            View view =
                (convertView ??
                    context.LayoutInflater.Inflate(
                        Resource.Layout.ListeEnseignantItem, parent, false)) as LinearLayout;

            view.FindViewById<TextView>(Resource.Id.tvInfoEnseignant).Text = listeEnseignant[position].Nom;

            return view;
        }
    }
}
