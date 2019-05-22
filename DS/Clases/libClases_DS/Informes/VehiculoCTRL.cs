using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using libComunes.CapaObjetos;


namespace libClases_DS.Informes
{
    public class VehiculoCTRL
    {
        #region Atributos/Propiedades
        private string SQL;
        public GridView grdInformeVehiculos { get; set; }
        public string error { get; private set; }
        public string parametroBusqueda { get; set; }
        #endregion

        #region Metodos
        public bool LlenarGrid()
        {
            if (grdInformeVehiculos == null)
            {
                error = "No definió el grid del informe de vehiculos";
                return false;
            }
            SQL = "SP_Consultar_vehiculo";
            clsGrid oGrid = new clsGrid();
            oGrid.SQL = SQL;
            oGrid.gridGenerico = grdInformeVehiculos;
            oGrid.StoredProcedure = true;
            if (oGrid.LlenarGridWeb())
            {
                grdInformeVehiculos = oGrid.gridGenerico;
                oGrid = null;
                return true;
            }
            else
            {
                error = oGrid.Error;
                oGrid = null;
                return false;
            }
        }

        public bool LlenarGridPorCriterio()
        {
            if (grdInformeVehiculos == null)
            {
                error = "No definió el grid del informe de vehiculos";
                return false;
            }
            SQL = "SP_Consultar_VehiculoXCriterio";
            clsGrid oGrid = new clsGrid();
            oGrid.SQL = SQL;
            oGrid.gridGenerico = grdInformeVehiculos;
            oGrid.AgregarParametro("@parametro_busqueda", parametroBusqueda);
            oGrid.StoredProcedure = true;
            if (oGrid.LlenarGridWeb())
            {
                grdInformeVehiculos = oGrid.gridGenerico;
                oGrid = null;
                return true;
            }
            else
            {
                error = oGrid.Error;
                oGrid = null;
                return false;
            }
        }

        #endregion


    }
}
