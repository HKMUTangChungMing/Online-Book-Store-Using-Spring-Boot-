package hkmu.comps380f.onlinebookstore.utils;

/**
 * Response tool class
 * @param <T>
 */
public class ApiResponse<T> {
    private  int code;
    private  String message;
    private  T data;

    public ApiResponse(int code,String message, T data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }
    public static <T> ApiResponse<T> success(String message,T data) {
        return new ApiResponse<T>(200, message,data);
    }

    public static <T> ApiResponse<T> success(T data) {
        return new ApiResponse<T>(200, "Request successful",data);
    }
    public static <T> ApiResponse<T> success() {
        return new ApiResponse<T>(200, "Request successful",null);
    }

    public static <T> ApiResponse<T> failed(String message) {
        return new ApiResponse<T>(201,message, null);
    }

    public static <T> ApiResponse<T> failed() {
        return new ApiResponse<T>(201,"Request failed", null);
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
