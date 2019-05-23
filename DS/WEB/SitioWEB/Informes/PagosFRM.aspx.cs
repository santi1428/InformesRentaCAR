using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls;
using libClases_DS.Informes;

namespace SitioWEB.Informes
{
    public partial class PagosFRM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGenerarInformePagos_Click(object sender, EventArgs e)
        {
            PagoCTRL oInformePago = new PagoCTRL();
            oInformePago.grdInformePagos = grdInformePagos;
            if (ddlValorCriterio.SelectedValue == "")
            {
                if (!oInformePago.LlenarGrid())
                {
                    lblError.Text = oInformePago.error;
                }
                else
                {
                    lblError.Text = "";
                }
            }
            //else
            //{
            //    oInformePago.parametroBusqueda = ddlValorCriterio.SelectedValue;
            //    if (!oInformePago.LlenarGridPorCriterio())
            //    {
            //        lblError.Text = oInformePago.error;
            //    }
            //    else
            //    {
            //        lblError.Text = "";
            //    }
            //}
            oInformePago = null;
        }
    }
}