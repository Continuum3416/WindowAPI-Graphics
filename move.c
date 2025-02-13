#include <windows.h>

// Initial position of the square
int squareX = 50;
int squareY = 50;
const int squareSize = 20;
const int moveStep = 10;

LRESULT CALLBACK WndProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
{
    switch (msg)
    {
        case WM_PAINT:
        {
            PAINTSTRUCT ps;
            HDC hdc = BeginPaint(hwnd, &ps);
            
            // Draw the square at its current position
            HBRUSH hBrush = CreateSolidBrush(RGB(0, 0, 0));
            HBRUSH oldBrush = (HBRUSH)SelectObject(hdc, hBrush);
            
            Rectangle(hdc, squareX, squareY, squareX + squareSize, squareY + squareSize);
            
            // Clean up
            SelectObject(hdc, oldBrush);
            DeleteObject(hBrush);
            EndPaint(hwnd, &ps);
        }
        break;

        case WM_KEYDOWN:
        {
            RECT rect;
            GetClientRect(hwnd, &rect); // Get window dimensions
            
            switch (wParam)
            {
                case VK_UP:
                    if (squareY - moveStep >= 0)
                        squareY -= moveStep;
                    break;
                case VK_DOWN:
                    if (squareY + squareSize + moveStep <= rect.bottom)
                        squareY += moveStep;
                    break;
                case VK_LEFT:
                    if (squareX - moveStep >= 0)
                        squareX -= moveStep;
                    break;
                case VK_RIGHT:
                    if (squareX + squareSize + moveStep <= rect.right)
                        squareX += moveStep;
                    break;
            }

            InvalidateRect(hwnd, NULL, TRUE); // Force the window to repaint
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
    WNDCLASSEX wc;
    HWND hwnd;
    MSG msg;
    
    wc.cbSize = sizeof(WNDCLASSEX);
    wc.style = CS_HREDRAW | CS_VREDRAW;
    wc.lpfnWndProc = WndProc;
    wc.cbClsExtra = 0;
    wc.cbWndExtra = 0;
    wc.hInstance = hInstance;
    wc.hIcon = LoadIcon(NULL, IDI_APPLICATION);
    wc.hCursor = LoadCursor(NULL, IDC_ARROW);
    wc.hbrBackground = (HBRUSH)(COLOR_WINDOW+1);
    wc.lpszMenuName = NULL;
    wc.lpszClassName = "MyWindow";
    wc.hIconSm = LoadIcon(NULL, IDI_APPLICATION);
    
    if (!RegisterClassEx(&wc))
    {
        MessageBox(NULL, "Window Registration Failed!", "Error!", MB_ICONEXCLAMATION | MB_OK);
        return 0;
    }
    
    hwnd = CreateWindowEx(0, "MyWindow", "Moving Square", WS_OVERLAPPEDWINDOW,
                          CW_USEDEFAULT, CW_USEDEFAULT, 600, 600,
                          NULL, NULL, hInstance, NULL);
    
    if (!hwnd)
    {
        MessageBox(NULL, "Window Creation Failed!", "Error!", MB_ICONEXCLAMATION | MB_OK);
        return 0;
    }
    
    ShowWindow(hwnd, nCmdShow);
    UpdateWindow(hwnd);
    
    while (GetMessage(&msg, NULL, 0, 0) > 0)
    {
        TranslateMessage(&msg);
        DispatchMessage(&msg);
    }
    
    return (int)msg.wParam;
}

// Run: gcc -o move move.c -lgdi32; ./move.exe

// AT&T: gcc -S move.c

// Intel: gcc -m32 -S -masm=intel move.c