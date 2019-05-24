using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using libComunes.CapaObjetos;


namespace libClases_DS.Informes
{
    public class PagoCTRL
    {
        #region Atributos/Propiedades
        private string SQL;
        public GridView grdInformePagos { get; set; }
        public string error { get; private set; }
        public string parametroBusqueda { get; set; }
        #endregion

        #region Metodos
        public bool LlenarGrid()
        {
            if (grdInformePagos == null)
            {
                error = "No definió el grid del informe de pagos";
                return false;
            }
            SQL = "SP_Consultar_Pago";
            clsGrid oGrid = new clsGrid();
            oGrid.SQL = SQL;
            oGrid.gridGenerico = grdInformePagos;
            oGrid.StoredProcedure = true;
            if (oGrid.LlenarGridWeb())
            {
                grdInformePagos = oGrid.gridGenerico;
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
            if (grdInformePagos == null)
            {
                error = "No definió el grid del informe de vehiculos";
                return false;

            }
            SQL = "SP_Consultar_PagoXCriterio";
            clsGrid oGrid = new clsGrid();
            oGrid.SQL = SQL;
            oGrid.gridGenerico = grdInformePagos;
            oGrid.AgregarParametro("@parametro_busqueda", parametroBusqueda);
            oGrid.StoredProcedure = true;
            if (oGrid.LlenarGridWeb())
            {
                grdInformePagos = oGrid.gridGenerico;
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
