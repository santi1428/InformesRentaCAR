using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using libClases_DS.Informes;

namespace SitioWEB.Informes
{
    public partial class AlquileresFRM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRealizarAlquiler_Click(object sender, EventArgs e)
        {
            LlenarGrid();
        }

        private void LlenarGrid()
        {
            AlquilerCTRL oAlquiler = new AlquilerCTRL();
            oAlquiler.grdInformeAlquileres = grdInformeAlquileres;
                if(oAlquiler.LlenarGrid())
                {
                    lblError.Text = oAlquiler.error;
                }
                else
                {
                    lblError.Text = "";
                }
            oAlquiler = null;
        }
    }
}