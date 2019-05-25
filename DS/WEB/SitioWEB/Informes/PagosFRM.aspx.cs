using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using libClases_DS.Informes;

namespace SitioWEB.Informes
{
    public partial class PagosFRM : System.Web.UI.Page
    {
        public string[] estados = new string[] { "Pendiente", "Realizado" };
        public string[] aseguradoras = new string[] { "ALLIANZ SEGUROS S.A", "ARL SURA.", "AXA COLPATRIA SEGUROS S.A.", "BBVA SEGUROS COLOMBIA S.A." };
        public string[] tipos = new string[] { "Efectivo", "Consignacion", "Efecty", "Consignación Bancaria", "Baloto" };

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGenerarInformePagos_Click(object sender, EventArgs e)
        {

                LlenarGrid();
            
        }

        private void LlenarGrid()
        {
            PagoCTRL oInformePago = new PagoCTRL();
            oInformePago.grdInformePagos = grdInformePagos;
            if (ddlOrdenar.SelectedValue == "0")
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
            else
            {
                oInformePago.parametroBusqueda = ddlValorCriterio.SelectedValue;
                oInformePago.parametroFechaInicial = txtFechaInicial.Text.Replace("-", ""); 
                oInformePago.parametroFechaFinal = txtFechaFinal.Text.Replace("-", "");
                if (!oInformePago.LlenarGridPorCriterio())
                {
                    lblError.Text = oInformePago.error;
                }
                else
                {
                    lblError.Text = "";
                }
            }
            oInformePago = null;
        }

        protected void ddlOrdenar_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlOrdenar.SelectedValue == "0")
            {
                ddlValorCriterio.Items.Clear();
            }

            if (ddlOrdenar.SelectedValue == "1")
            {
                LlenarValoresSeleccion(estados);
            }

            if (ddlOrdenar.SelectedValue == "2")
            {
                LlenarValoresSeleccion(aseguradoras);
            }

            if (ddlOrdenar.SelectedValue == "3")
            {
                ddlValorCriterio.Items.Clear();
                LlenarComboClientes();
            }

            if (ddlOrdenar.SelectedValue == "4")
            {
                LlenarValoresSeleccion(tipos);
            }

            if (ddlOrdenar.SelectedValue == "5")
            {
                ddlValorCriterio.Items.Clear();
                txtFechaInicial.Enabled = true;
                txtFechaFinal.Enabled = true;
            }
            else
            {
                txtFechaInicial.Enabled = false;
                txtFechaFinal.Enabled= false;
                txtFechaInicial.Text = "";
                txtFechaFinal.Text = "";

            }

        }

        private void LlenarComboClientes()
        {
            PagoCTRL oInformePago = new PagoCTRL();
            oInformePago.cboCliente = ddlValorCriterio;
            if (oInformePago.LlenarCombo())
            {
                lblError.Text = "";
            }
            else
            {
                lblError.Text = oInformePago.error;
            }

            oInformePago = null;
        }

        

        private void LlenarValoresSeleccion(string[] arr)
        {
            ddlValorCriterio.Items.Clear();
            for (int i = 0; i < arr.Length; i++)
            {
                ListItem d;
                d = new ListItem(arr[i], arr[i]);
                ddlValorCriterio.Items.Add(d);
            }
        }

    }
}