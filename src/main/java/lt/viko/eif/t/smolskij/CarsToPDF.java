package lt.viko.eif.t.smolskij;

import org.apache.fop.apps.*;

import javax.xml.transform.Result;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;

public class CarsToPDF {
    public static void main(String[] args){
        try{
            convertToPDF();
        } catch (FOPException | IOException | TransformerException e){
            System.out.println(e.getMessage());
        }
    }

    public static void convertToPDF() throws IOException, FOPException, TransformerException {

        File xsltFile = new File("cars.xsl");

        StreamSource xmlSource = new StreamSource(new File("cars.xml"));

        FopFactory fopFactory = FopFactory.newInstance(new File(".").toURI());

        FOUserAgent foUserAgent = fopFactory.newFOUserAgent();

        OutputStream out;

        out = new java.io.FileOutputStream("output.pdf");

        try{

            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, out);

            TransformerFactory factory = TransformerFactory.newInstance();

            Transformer transformer = factory.newTransformer(new StreamSource(xsltFile));

            Result res = new SAXResult(fop.getDefaultHandler());

            transformer.transform(xmlSource, res);

        } finally {
            out.close();
        }
    }
}
