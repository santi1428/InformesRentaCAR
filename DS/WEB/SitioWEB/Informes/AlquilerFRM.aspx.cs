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

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            btnRegistrarAlquiler.Enabled = false;
            Int32 codigo = Convert.ToInt32(txtCodigoReserva.Text);
            ReservaCTRL oReserva = new ReservaCTRL();
            oReserva.grdReservas = grdReservas;
            oReserva.codigo = codigo;
            if (oReserva.LlenarGridPorCriterio())
            {
                lblError.Text = "";
            }
            else
            {
                lblError.Text = oReserva.error;
            }
        }

        protected void grdReservas_SelectedIndexChanged(object sender, EventArgs e)
        {

            btnRegistrarAlquiler.Enabled = true;
            txtFechaInicial.Text = grdReservas.SelectedRow.Cells[3].Text;
            txtFechaFinal.Text = grdReservas.SelectedRow.Cells[4].Text;

        }

        protected void btnRegistrarAlquiler_Click(object sender, EventArgs e)
        {
            string fechaInicial, fechaFinal;
            Int32   kmInicial, reservaId;

            fechaInicial = txtFechaInicial.Text;
            fechaFinal = txtFechaFinal.Text;
            kmInicial = Convert.ToInt32(txtKMInicial.Text);
            reservaId = Convert.ToInt32(grdReservas.SelectedRow.Cells[1].Text);
            AlquilerCTRL oAlquiler = new AlquilerCTRL();
            oAlquiler.fechaInicial = fechaInicial;
            oAlquiler.fechaFinal = fechaFinal;
            oAlquiler.kmInicial = kmInicial;
            oAlquiler.reservaId = reservaId;
            if (oAlquiler.Ingresar())
            {
                lblError.Text = "Se ha realizado el alquiler con éxito";
                btnRegistrarAlquiler.Enabled = false;
                limpiarCampos();
            }
            else
            {
                lblError.Text = oAlquiler.error;
            }
        }

        private void limpiarCampos()
        {
            txtFechaInicial.Text = "";
            txtFechaFinal.Text = "";
            txtKMInicial.Text = "";
            grdReservas.DataSource = "";
            grdReservas.DataBind();
        }
    }
}