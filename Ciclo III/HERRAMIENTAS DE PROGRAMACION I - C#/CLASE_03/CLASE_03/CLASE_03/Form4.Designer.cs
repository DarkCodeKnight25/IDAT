namespace CLASE_03
{
    partial class Form4
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.lbx_categoria = new System.Windows.Forms.ListBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.lbx_producto = new System.Windows.Forms.ListBox();
            this.label2 = new System.Windows.Forms.Label();
            this.tb_producto = new System.Windows.Forms.TextBox();
            this.tb_precio = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Bookman Old Style", 24F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(175, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(206, 38);
            this.label1.TabIndex = 0;
            this.label1.Text = "CATALOGO";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.lbx_categoria);
            this.groupBox1.Location = new System.Drawing.Point(12, 84);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(250, 248);
            this.groupBox1.TabIndex = 1;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "CATEGORIA";
            // 
            // lbx_categoria
            // 
            this.lbx_categoria.FormattingEnabled = true;
            this.lbx_categoria.Items.AddRange(new object[] {
            "DISCOS DUROS",
            "DISCOS DUROS EXTERNOS",
            "FUENTES DE PODER"});
            this.lbx_categoria.Location = new System.Drawing.Point(6, 19);
            this.lbx_categoria.Name = "lbx_categoria";
            this.lbx_categoria.Size = new System.Drawing.Size(238, 225);
            this.lbx_categoria.TabIndex = 0;
            this.lbx_categoria.SelectedIndexChanged += new System.EventHandler(this.lbx_categoria_SelectedIndexChanged);
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.lbx_producto);
            this.groupBox2.Location = new System.Drawing.Point(301, 84);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(286, 248);
            this.groupBox2.TabIndex = 2;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "PRODUCTO";
            // 
            // lbx_producto
            // 
            this.lbx_producto.FormattingEnabled = true;
            this.lbx_producto.Location = new System.Drawing.Point(6, 19);
            this.lbx_producto.Name = "lbx_producto";
            this.lbx_producto.Size = new System.Drawing.Size(274, 225);
            this.lbx_producto.TabIndex = 0;
            this.lbx_producto.SelectedIndexChanged += new System.EventHandler(this.lbx_producto_SelectedIndexChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(209, 361);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(68, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "PRODUCTO";
            // 
            // tb_producto
            // 
            this.tb_producto.Location = new System.Drawing.Point(283, 354);
            this.tb_producto.Name = "tb_producto";
            this.tb_producto.Size = new System.Drawing.Size(277, 20);
            this.tb_producto.TabIndex = 4;
            // 
            // tb_precio
            // 
            this.tb_precio.Location = new System.Drawing.Point(283, 380);
            this.tb_precio.Name = "tb_precio";
            this.tb_precio.Size = new System.Drawing.Size(277, 20);
            this.tb_precio.TabIndex = 6;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(209, 387);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(47, 13);
            this.label3.TabIndex = 5;
            this.label3.Text = "PRECIO";
            // 
            // Form4
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(591, 429);
            this.Controls.Add(this.tb_precio);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.tb_producto);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.label1);
            this.Name = "Form4";
            this.Text = "CATALOGO";
            this.groupBox1.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.ListBox lbx_categoria;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.ListBox lbx_producto;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox tb_producto;
        private System.Windows.Forms.TextBox tb_precio;
        private System.Windows.Forms.Label label3;
    }
}