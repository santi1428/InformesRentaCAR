using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using libClases_DS.Informes;

namespace SitioWEB.Informes
{
    public partial class VehiculosFRM : System.Web.UI.Page
    {

        public string[] marcas = new string[] { "Mazda", "Renault", "Skoda", "BMW", "Mercedez Benz", "Skodas", "Suzuki" };
        public string[] tipos = new string[] { "Automovil", "Bus", "Buseta", "Campero", "Camion Grand", "Camion", "Camion Pequeño", "Microbus", "Camioneta", "Tracto Camion" };
        public string[] estados = new string[] { "Disponible", "No disponible" };
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void btnGenerarInformeVehiculos_Click(object sender, EventArgs e)
        {
            LlenarGrid();
        }

        private void LlenarGrid()
        {
            VehiculoCTRL oInformeVehiculo = new VehiculoCTRL();
            oInformeVehiculo.grdInformeVehiculos = grdInformeVehiculos;
            if (ddlValorCriterio.SelectedValue == "")
            {
                if (!oInformeVehiculo.LlenarGrid())
                {
                    lblError.Text = oInformeVehiculo.error;
                }
                else
                {
                    lblError.Text = "";
                }
            }
            else
            {
                oInformeVehiculo.parametroBusqueda = ddlValorCriterio.SelectedValue;
                if (!oInformeVehiculo.LlenarGridPorCriterio())
                {
                    lblError.Text = oInformeVehiculo.error;
                }
                else
                {
                    lblError.Text = "";
                }
            }
            oInformeVehiculo = null;
        }


        protected void ddlOrdenar_SelectedIndexChanged(object sender, EventArgs e)
        {
         
                if (ddlOrdenar.SelectedValue == "3")
                {
                    LlenarValoresSeleccion(marcas);
                }

                if (ddlOrdenar.SelectedValue == "4")
                {
                    LlenarValoresSeleccion(tipos);
                }

                if (ddlOrdenar.SelectedValue == "2")
                {
                    LlenarValoresSeleccion(estados);
                }

                if (ddlOrdenar.SelectedValue == "0")
                {
                    ddlValorCriterio.Items.Clear();
                    ListItem d;
                    d = new ListItem("", "");
                    ddlValorCriterio.Items.Add(d);
                }
            
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

        protected void ddlValorCriterio_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}