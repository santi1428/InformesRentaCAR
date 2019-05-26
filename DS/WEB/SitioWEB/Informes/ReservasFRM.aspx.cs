using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using libClases_DS.Informes;


namespace SitioWEB.Informes
{
    public partial class ReservasFRM : System.Web.UI.Page
    {

        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscarVehiculos_Click(object sender, EventArgs e)
        {
                if(ddlGamas.SelectedValue != "0")
                {
                    VehiculoCTRL oVehiculo = new VehiculoCTRL();
                    oVehiculo.grdInformeVehiculos = grdInformeVehiculos;
                    oVehiculo.parametroBusqueda = ddlGamas.SelectedValue;
                    if (!oVehiculo.LlenarGridVehiculosDisponibles())
                    {
                        lblError.Text = oVehiculo.error;
                    }
                oVehiculo = null;
            }
                else
                {
                    VehiculoCTRL oVehiculo = new VehiculoCTRL();
                    oVehiculo.grdInformeVehiculos = grdInformeVehiculos;
                    if (!oVehiculo.LlenarGridVehiculosDisponibles())
                    {
                        lblError.Text = oVehiculo.error;
                    }
                oVehiculo = null;
            }
            

        }

        protected void grdInformeVehiculos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string matriculaVehiculo, fechaInicial, fechaFinal, DocumentoCliente;
            
            matriculaVehiculo = grdInformeVehiculos.SelectedRow.Cells[1].Text;
            fechaInicial = txtFechaInicial.Text;
            fechaFinal = txtFechaFinal.Text;
            DocumentoCliente = txtDocumentoCliente.Text;

            ReservaCTRL oReserva = new ReservaCTRL();
            oReserva.matriculaVehiculo = matriculaVehiculo;
            oReserva.documentoCliente = DocumentoCliente;
            oReserva.fechaFinal = fechaFinal;
            oReserva.fechaInicial = fechaInicial;

            if (oReserva.Ingresar())
            {
                lblError.Text = "Se ha realizado la reserva exitosamente";
            }
            else
            {
                lblError.Text = oReserva.error;
            }

            oReserva = null;

        }
    }
}