#include <windows.h>

const int squareSize = 25;   // Size of each cell (including gaps)
const int gapSize = 1;       // White space between squares
const int moveStep = 25;     // Movement step

LRESULT CALLBACK WndProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
{
    static int windowWidth, windowHeight;

    switch (msg)
    {
        case WM_SIZE:
            // Update window size when resized
            windowWidth = LOWORD(lParam);
            windowHeight = HIWORD(lParam);
            InvalidateRect(hwnd, NULL, TRUE);
            break;
        case WM_PAINT:
        {
            PAINTSTRUCT ps;
            HDC hdc = BeginPaint(hwnd, &ps);
        
            // Define the color for both fill and border
            COLORREF color = RGB(155, 204, 153); // Light green
        
            // Create a solid brush for the fill
            HBRUSH hBrush = CreateSolidBrush(color);
            // Create a solid pen for the border (2px width)
            HPEN hPen = CreatePen(PS_SOLID, 2, color);
        
            // Save the old brush and pen
            HBRUSH oldBrush = (HBRUSH)SelectObject(hdc, hBrush);
            HPEN oldPen = (HPEN)SelectObject(hdc, hPen);
        
            // Calculate rows and columns
            int rows = windowHeight / squareSize;
            int cols = windowWidth / squareSize;
        
            // Loop to draw the grid with gaps
            for (int i = 0; i < rows; i++)
            {
                for (int j = 0; j < cols; j++)
                {
                    int x = j * squareSize + gapSize;  // Shift right for gap
                    int y = i * squareSize + gapSize;  // Shift down for gap
                    int size = squareSize - (2 * gapSize); // Shrink square to leave gaps
        
                    // Draw the square with the same border and fill color
                    Rectangle(hdc, x, y, x + size, y + size);
                }
            }
        
            // Clean up: restore the old brush and pen, and delete the new ones
            SelectObject(hdc, oldBrush);
            SelectObject(hdc, oldPen);
            DeleteObject(hBrush);
            DeleteObject(hPen);
        
            EndPaint(hwnd, &ps);
        }
        break;

        case WM_DESTROY:
            PostQuitMessage(0);
            break;

        default:
            return DefWindowProc(hwnd, msg, wParam, lParam);
    }
    return 0;
}

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
{
    WNDCLASSEX wc = { 
          sizeof(WNDCLASSEX)
        , CS_HREDRAW | CS_VREDRAW
        , WndProc, 0, 0, hInstance
        , LoadIcon(NULL, IDI_APPLICATION)
        , LoadCursor(NULL, IDC_ARROW)
        , (HBRUSH)(COLOR_WINDOW + 1)
        , NULL
        , "MyWindow"
        , LoadIcon(NULL, IDI_APPLICATION)
    };
    wc.hbrBackground = CreateSolidBrush(RGB(255, 255, 255));

    if (!RegisterClassEx(&wc))
    {
        MessageBox(NULL, "Window Registration Failed!", "Error!", MB_ICONEXCLAMATION | MB_OK);
        return 0;
    }

    HWND hwnd = CreateWindowEx(0, "MyWindow", "Grid of Squares with Gaps", WS_OVERLAPPEDWINDOW,
                               CW_USEDEFAULT, CW_USEDEFAULT, 700, 700, NULL, NULL, hInstance, NULL);

    if (!hwnd)
    {
        MessageBox(NULL, "Window Creation Failed!", "Error!", MB_ICONEXCLAMATION | MB_OK);
        return 0;
    }

    ShowWindow(hwnd, nCmdShow);
    UpdateWindow(hwnd);

    MSG msg;
    while (GetMessage(&msg, NULL, 0, 0) > 0)
    {
        TranslateMessage(&msg);
        DispatchMessage(&msg);
    }

    return (int)msg.wParam;
}


// Run: gcc -o bin/grid.exe grid.c -lgdi32; ./bin/grid.exe