import java.io.IOException;
import java.io.UncheckedIOException;
import java.io.Writer;

public class IndentedWriter {
  private static final String INDENT = "  ";
  private final Writer writer;
  private int indentsCount = 0;

  public IndentedWriter(Writer writer) {
    this.writer = writer;
  }

  public void indent() {
    indentsCount++;
  }

  public void dedent() {
    indentsCount--;
  }

  public void writeLine(String line) {
    try {
      writer.write(INDENT.repeat(indentsCount) + line + "\n");
    } catch (IOException e) {
      throw new UncheckedIOException(e);
    }
  }
}
