import format.psx.tim.Reader;
import format.psx.tim.Data;

import format.psx.cmp.Reader;
import format.psx.cmp.Data;

import format.png.Tools;
import format.png.Writer;

class Binary2 {
      static public function main():Void {
          trace("Binary2");
          var input1_tim = sys.io.File.read("TRAKVIEW.TIM", true);
          var data1_tim = new format.psx.tim.Reader(input1_tim).read();
          format.psx.tim.Tools.dumpHeader(data1_tim);
          
          var input2_tim = sys.io.File.read("SLIDE.TIM", true);
          var data2_tim = new format.psx.tim.Reader(input2_tim).read();
          format.psx.tim.Tools.dumpHeader(data2_tim);
          
          var input3_tim = sys.io.File.read("WIPTITLE.TIM", true);
          var data3_tim = new format.psx.tim.Reader(input3_tim).read();
          format.psx.tim.Tools.dumpHeader(data3_tim);

          var png_data1 = format.psx.tim.Tools.exportToPNG(data1_tim);
          var output1_png = sys.io.File.write("TRAKVIEW.PNG", true);
          new format.png.Writer(output1_png).write(png_data1);
          var image1_tim = format.psx.tim.Tools.extractFullRGBA(data1_tim);
          var output_image1_tim = sys.io.File.write("TRAKVIEW.OUTPUT", true);
          output_image1_tim.write(image1_tim);          

          var png_data2 = format.psx.tim.Tools.exportToPNG(data2_tim);
          var output2_png = sys.io.File.write("SLIDE.PNG", true);
          new format.png.Writer(output2_png).write(png_data2);
          
          var png_data3 = format.psx.tim.Tools.exportToPNG(data3_tim);
          var output3_png = sys.io.File.write("WIPTITLE.PNG", true);
          new format.png.Writer(output3_png).write(png_data3);
          var image3_tim = format.psx.tim.Tools.extractFullRGBA(data3_tim);
          var output_image3_tim = sys.io.File.write("WIPTITLE.OUTPUT", true);
          output_image3_tim.write(image3_tim);          

          var output1_tim = sys.io.File.write("TRAKVIEW.OUT.TIM", true);
          new format.psx.tim.Writer(output1_tim).write(data1_tim);
          
          var output2_tim = sys.io.File.write("SLIDE.OUT.TIM", true);
          new format.psx.tim.Writer(output2_tim).write(data2_tim);
          
          var output3_tim = sys.io.File.write("WIPTITLE.OUT.TIM", true);
          new format.psx.tim.Writer(output3_tim).write(data3_tim);

          var input4_tim = sys.io.File.read("LOAD1.TIM", true);
          var data4_tim = new format.psx.tim.Reader(input4_tim).read();
          var png_data4 = format.psx.tim.Tools.exportToPNG(data4_tim);
          var output4_png = sys.io.File.write("LOAD1.PNG", true);
          new format.png.Writer(output4_png).write(png_data4);

          input4_tim = null;
          data4_tim = null;
          png_data4 = null;
          output4_png = null;
          input4_tim = sys.io.File.read("LOAD2.TIM", true);
          data4_tim = new format.psx.tim.Reader(input4_tim).read();
          png_data4 = format.psx.tim.Tools.exportToPNG(data4_tim);
          output4_png = sys.io.File.write("LOAD2.PNG", true);
          new format.png.Writer(output4_png).write(png_data4);          

          input4_tim = null;
          data4_tim = null;
          png_data4 = null;
          output4_png = null;
          input4_tim = sys.io.File.read("COPYRIGT.TIM", true);
          data4_tim = new format.psx.tim.Reader(input4_tim).read();
          png_data4 = format.psx.tim.Tools.exportToPNG(data4_tim);
          output4_png = sys.io.File.write("COPYRIGT.PNG", true);
          new format.png.Writer(output4_png).write(png_data4);          
          
          input4_tim = null;
          data4_tim = null;
          png_data4 = null;
          output4_png = null;
          input4_tim = sys.io.File.read("MISS.TIM", true);
          data4_tim = new format.psx.tim.Reader(input4_tim).read();
          png_data4 = format.psx.tim.Tools.exportToPNG(data4_tim);
          output4_png = sys.io.File.write("MISS.PNG", true);
          new format.png.Writer(output4_png).write(png_data4);
          
          input4_tim = null;
          data4_tim = null;
          png_data4 = null;
          output4_png = null;
          input4_tim = sys.io.File.read("output0.tim", true);
          data4_tim = new format.psx.tim.Reader(input4_tim).read();
          png_data4 = format.psx.tim.Tools.exportToPNG(data4_tim);
          output4_png = sys.io.File.write("output0.png", true);
          new format.png.Writer(output4_png).write(png_data4);

          input4_tim = null;
          data4_tim = null;
          png_data4 = null;
          output4_png = null;
          input4_tim = sys.io.File.read("output1.tim", true);
          data4_tim = new format.psx.tim.Reader(input4_tim).read();
          png_data4 = format.psx.tim.Tools.exportToPNG(data4_tim);
          output4_png = sys.io.File.write("output1.png", true);
          new format.png.Writer(output4_png).write(png_data4);

          var input3 = sys.io.File.read("RACEBUTT.CMP", true);
          var data2 = new format.psx.cmp.Reader(input3).read();
          for(i in 0 ... data2.timsNum)
          {
            var png = format.psx.tim.Tools.exportToPNG(data2.tims[i]);
            var output_png = sys.io.File.write("RACEBUTT" + i + ".png", true);
            new format.png.Writer(output_png).write(png);          
          }

          var input5 = sys.io.File.read("ALLSH.CMP", true);
          var data5 = new format.psx.cmp.Reader(input5).read();
          for(i in 0 ... data5.timsNum)
          {
            var png = format.psx.tim.Tools.exportToPNG(data5.tims[i]);
            var output_png = sys.io.File.write("ALLSH" + i + ".png", true);
            new format.png.Writer(output_png).write(png);          
          }

          var input4 = sys.io.File.read("ALLSH.PRM", true);
          var data4 = new format.psx.prm.Reader(input4).read();

          var output4 = sys.io.File.write("ALLSH.OUT.PRM", true);
          new format.psx.prm.Writer(output4).write(data4);
          var output = sys.io.File.write("RACEBUTT.OUT.CMP", true);
          new format.psx.cmp.Writer(output).write(data2);
      }
    }