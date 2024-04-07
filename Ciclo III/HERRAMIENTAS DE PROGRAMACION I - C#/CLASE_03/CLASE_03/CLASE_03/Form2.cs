using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CLASE_03
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void bt_tamaño_Click(object sender, EventArgs e)
        {
            if (rb_n1.Checked == true)
            {
                Width = 640;
                Height = 480;
            }

            if (rb_n2.Checked == true)
            {
                Width = 800;
                Height = 600;
            }

            if (rb_n3.Checked == true)
            {
                Width = 1024;
                Height = 768;
            }


        }
    }
}
