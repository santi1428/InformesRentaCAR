using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using libComunes.CapaObjetos;

namespace libClases_DS.Informes
{
    public class AlquilerCTRL
    {
        #region Atributos/Propiedades
        private string SQL;
        public GridView grdInformeAlquileres { get; set; }
        public string error { get; private set; }
        #endregion

        #region Metodos
        public bool LlenarGrid()
        {
            if (grdInformeAlquileres == null)
            {
                error = "No definió el grid del informe de vehiculos";
                return false;
            }
            SQL = "SP_Consultar_Alquiler";
            clsGrid oGrid = new clsGrid();
            oGrid.SQL = SQL;
            oGrid.gridGenerico = grdInformeAlquileres;
            oGrid.StoredProcedure = true;
            if (oGrid.LlenarGridWeb())
            {
                grdInformeAlquileres = oGrid.gridGenerico;
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
