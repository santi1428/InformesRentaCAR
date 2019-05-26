using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using libClases_DS.Informes;

namespace SitioWEB.Informes
{
    public partial class DevolucionFRM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDevolverVehiculo_Click(object sender, EventArgs e)
        {
            string  descripcionEntrega;
            Int32 reservaCodigo, kmFinal, multa;
            reservaCodigo = Convert.ToInt32(txtCodigoReserva.Text);
            kmFinal = Convert.ToInt32(txtKMFinal.Text);
            multa = Convert.ToInt32(txtMulta.Text);
            descripcionEntrega = txtDescripcionEntrega.Text;
            DevolucionCTRL oDevolucion = new DevolucionCTRL();
            oDevolucion.reservaCodigo = reservaCodigo;
            oDevolucion.kmFinal = kmFinal;
            oDevolucion.multa = multa;
            oDevolucion.descripcion = descripcionEntrega;
            if (oDevolucion.Ingresar())
            {
                lblError.Text = "Se ha devuelto el vehiculo satisfactoriamente";
            }
            else
            {
                lblError.Text = oDevolucion.error;
            }
            oDevolucion = null;
        }
    }
}