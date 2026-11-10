using Android.Security.Identity;
using Android.Views;
using GestionCegepMobile.DTOs;
using System;
using System.Collections.Generic;
using System.Text;

namespace GestionCegepMobile.Adapteurs
{
    public class ListeDepartementAdapter : BaseAdapter<DepartementDTO>
    {
        private Activity context;
        private DepartementDTO[] listeDepartement;

        public ListeDepartementAdapter(Activity unContext, DepartementDTO[] uneListeDepartement)
        {
            context = unContext;
            listeDepartement = uneListeDepartement;
        }

        public override DepartementDTO this[int index]
        {
            get { return listeDepartement[index]; }
        }

        public override long GetItemId(int position)
        {
            return position;
        }

        public override int Count
        {
            get { return listeDepartement.Length; }
        }

        public override View GetView(int position, View convertView, ViewGroup parent)
        {
            View view =
                (convertView ??
                    context.LayoutInflater.Inflate(
                        Resource.Layout.ListeDepartementItem, parent, false)) as LinearLayout;
            view.FindViewById<TextView>(Resource.Id.tvNomDepartement).Text = listeDepartement[position].Nom;

            return view;
        }
    }
}
