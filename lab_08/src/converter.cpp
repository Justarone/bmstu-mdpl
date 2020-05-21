#include <gtkmm-3.0/gtkmm.h>
#include <string>

#define DEFAULT_OUTPUT_FILE "tmp/output.png"
#define COEFF_R 0.2126
#define COEFF_G 0.7152
#define COEFF_B 0.0722

#define DEFAULT_SOURCE_FILE "meta/donut.png"

//#define COEFF_R 0.299
//#define COEFF_G 0.587
//#define COEFF_B 0.114

using namespace std;

double get_value(unsigned char *pixel) {
    double value;
    double blue = pixel[0], green = pixel[1], red[2];
    double cr = COEFF_R, cg = COEFF_G, cb = COEFF_B;
    __asm__(
            "fldl %3\n\t"
            "fmull %4\n\t"
            "fldl %2\n\t"
            "fmull %5\n\t"
            "fldl %1\n\t"
            "fmull %6\n\t"
            "faddp\n\t"
            "faddp\n\t"
            "fstpl %0\n\t"
            : "=m"(value) 
            : "m"(blue), "m"(green), "m"(red), "m"(cr), "m"(cg), "m"(cb)
            :
           );
    return value;
}

void convert(unsigned char *pixel) {
    // BGRA
    //double value = COEFF_R * pixel[2] + COEFF_G * pixel[1] + COEFF_B * pixel[0];
    double value = get_value(pixel);
    for (int i = 0; i < 3; i++)
        pixel[i] = static_cast<unsigned char>(value);
}

int main(int argc, char **argv) {
    const char *infile = DEFAULT_SOURCE_FILE;
    if (argc > 1)
        infile = argv[1];

    auto surface = Cairo::ImageSurface::create_from_png(infile);
    unsigned char *pixels = surface->get_data();
    int a = surface->get_width(), b = surface->get_height();

    auto cur_pixel = pixels;
    for (long long int i = 0; i < static_cast<long long int>(a) * b; i++, cur_pixel += 4)
        convert(cur_pixel);

    const char *outfile = DEFAULT_OUTPUT_FILE;
    if (argc > 2)
        outfile = argv[2];

    surface->write_to_png(outfile);
    return 0;
}
