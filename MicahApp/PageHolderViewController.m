//
//  PageHolderViewController.m
//  MicahApp
//
//  Created by Gabriel Nopper on 27/07/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "PageHolderViewController.h"
#import "ProdutosOrcamentoTableViewController.h"
#import "ListaObsOrcaTableViewController.h"
#import <CoreText/CoreText.h>
#import "SaveData.h"
#import "orcamentos.h"
#import "PedidoDeProduto.h"

@interface PageHolderViewController ()


@end

@implementation PageHolderViewController{
    NSInteger currentPage;
    NSArray *topButtonNames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    if(![SaveData sharedAppData].currentOrca){
        SaveData *save = [SaveData sharedAppData];
        orcamentos *newOrca = [[orcamentos alloc] init];
        
        [save.unfinishedList addObject:newOrca];
        [save save];
        
        save.currentOrca = newOrca;
        // O currentOrca onde ocorrem as alterações. É importante setar ele na continuação também, pois a referencia na edição e caixas de texto e etc. vem aqui.
        //P.S.: Current orca não salva, é apenas um elemento singleton.
    }
    
    
   
    
#pragma "Feijão"
    
    _pageTitles = @[@"Dados do Cliente", @"Produtos", @"Ajustes", @"Observações", @"Finalização"];
    topButtonNames = @[@"", @"Adicionar", @"", @"Adicionar", @"Finalizar"];
#warning Substituir pelo de baixo caso importe no final.
    // topButtonNames = @[@"Importar", @"Adicionar", @"", @"Adicionar", @"Finalizar"];
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CreateOrca"];
    self.pageViewController.dataSource = self;
    
    ContentClientViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    currentPage = 0;
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    self.TopBar.title = self.pageTitles[0];
    self.topBarButton.title = topButtonNames[0];
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((ContentClientViewController*) viewController).pageIndex;
    self.TopBar.title = self.pageTitles[index];
    self.topBarButton.title = topButtonNames[index];
    currentPage = index;

    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;

    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((ContentClientViewController*) viewController).pageIndex;
    self.TopBar.title = self.pageTitles[index];
    self.topBarButton.title = topButtonNames[index];
    currentPage = index;

    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;

    
    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (id)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    // Cria view controller adequado para cada coisa
    
    switch (index) {
        case 0:{
            ContentClientViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ContentClient"];
            pageContentViewController.titleText = self.pageTitles[index];
            pageContentViewController.pageIndex = index;

            return pageContentViewController;
            break;
        }
        
        case 1:{
            ContentProductTableViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ContentProduct"];
            pageContentViewController.pageIndex = index;
            
            return pageContentViewController;
            break;
        }
        case 2:{
            ContentAdjustmentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ContentAdjustment"];
            pageContentViewController.pageIndex = index;

            return pageContentViewController;
            break;
        }
        case 3:{
            ContentObservationTableViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ContentObservation"];
            pageContentViewController.pageIndex = index;

            return pageContentViewController;
            break;
        }
        case 4:{
            ContentFinilizeViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ContentFinilize"];
            pageContentViewController.pageIndex = index;

            return pageContentViewController;
            break;
        }
        default:{
            ContentClientViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ContentClient"];
            pageContentViewController.titleText = self.pageTitles[index];
            pageContentViewController.pageIndex = index;

            return pageContentViewController;
            break;
        }
    }
}


- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageTitles count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (IBAction)TopBarButtonAction:(id)sender {
    
    switch (currentPage) {
        case 0:
            NSLog(@"0");
            break;
        case 1:{
            ProdutosOrcamentoTableViewController *pageContentProdutosOrcamento = [self.storyboard instantiateViewControllerWithIdentifier:@"telaProdOrcamento"];
            [self.navigationController pushViewController:pageContentProdutosOrcamento animated:YES];
            
            
            NSLog(@"1");
            break;
        }
        case 2:
            NSLog(@"2");
            break;
        case 3:{
            ListaObsOrcaTableViewController *pageContentListaObservacaoOrcamento = [self.storyboard instantiateViewControllerWithIdentifier:@"listaObsOrca"];
            [self.navigationController pushViewController:pageContentListaObservacaoOrcamento animated:YES];
        
         
            
            NSLog(@"3");
            break;
        }
        case 4:
            NSLog(@"4");
            [self generateRandomPDF];
            [self performSegueWithIdentifier:@"FromPageToPDF" sender:self];
            break;
        
            
        default:
            break;
    }
    
}

static const CGRect A4_SIZE = { { 0.0f, 0.0f }, { 21.0 * 72.0 / 2.54, 29.97 * 72.0 / 2.54 } };

- (void)renderRectangle:(CGRect)rectangle {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    
    UIColor* blackColor = [UIColor blackColor];
    CGContextSetStrokeColorWithColor(context, [blackColor CGColor]);
    
    CGContextAddRect(context, rectangle);
    
    CGContextStrokePath(context);
    //UIBezierPath *path = [UIBezierPath bezierPathWithRect:rectangle];
    
}

- (void)generateRandomPDF
{
    
    NSString *pdfFileName = [self getPDFFileName];
    // Create the PDF context using the default page size of A4;
    
    UIGraphicsBeginPDFContextToFile(pdfFileName, A4_SIZE, nil);
    
    //CFRange currentRange = CFRangeMake(0, 0);
    //NSInteger currentPage = 0;
    //            BOOL done = NO;
    //
    //            do {
    // Mark the beginning of a new page.
    UIGraphicsBeginPDFPageWithInfo(A4_SIZE, nil);
    
    
    SaveData *sd = [SaveData sharedAppData];
    /** CABECALHO **/
    
    
    
    [self drawText:[NSString stringWithFormat:@"%@\n%@\n%@\n%@", sd.userName == nil?@"": sd.userName, sd.userPhone == nil?@"": sd.userPhone, sd.userMail == nil?@"": sd.userMail, sd.userAddress == nil?@"": sd.userAddress] inRectangle:CGRectMake(86, 88, 219, 132)];
    
    [self drawText:@"ORÇAMENTO" inRectangle:CGRectMake(86, 227, 453, 25)];
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    UIImage *image = sd.userIcon;
    
    CGFloat maxHorizontalAspectRatio = 223.0 / image.size.width;
    CGFloat maxVerticalAspectRatio = 131.0 / image.size.height;
    CGFloat aspectRatio;
    
    if (maxHorizontalAspectRatio < maxVerticalAspectRatio) {
        aspectRatio = maxHorizontalAspectRatio;
    } else {
        aspectRatio = maxVerticalAspectRatio;
    }
    
    CGRect imageRect = CGRectMake(314 + 223 - image.size.width * aspectRatio, 85, image.size.width * aspectRatio, image.size.height * aspectRatio);
    imageRect = CGRectMake(imageRect.origin.x, A4_SIZE.size.height - imageRect.origin.y - imageRect.size.height, imageRect.size.width, imageRect.size.height);
    
    CGContextScaleCTM(currentContext, 1.0, -1.0);
    CGContextTranslateCTM(currentContext, 0, -A4_SIZE.size.height);
    
    CGContextDrawImage(UIGraphicsGetCurrentContext(), imageRect, image.CGImage);
    
    CGContextTranslateCTM(currentContext, 0, A4_SIZE.size.height);
    CGContextScaleCTM(currentContext, 1.0, -1.0);
    
    
    /** DADOS DO CLIENTE **/
    
    [self renderRectangle:CGRectMake(86, 256, 451, 30)];
    [self renderRectangle:CGRectMake(86, 256, 451, 106)];
    [self drawCenteredText:@"DADOS DO CLIENTE" inRectangle:CGRectMake(86, 256, 451, 30)];
    [self drawText:[NSString stringWithFormat:@"%@\n%@ | %@\n%@", sd.currentOrca.costumerName, sd.currentOrca.costumerTelephone, sd.currentOrca.costumerEmail, sd.currentOrca.costumerAdress] inRectangle:CGRectMake(86, 286, 451, 76)];
    
    /** ITENS DO ORCAMENTO **/
    
    [self renderRectangle:CGRectMake(86, 384, 448, 29)];
    [self renderRectangle:CGRectMake(127, 384, 41, 29)];
    [self renderRectangle:CGRectMake(374, 384, 84, 29)];
    [self drawCenteredText:@"ITEM" inRectangle:CGRectMake(86, 384, 41, 29)];
    [self drawCenteredText:@"QTD." inRectangle:CGRectMake(127, 384, 41, 29)];
    [self drawCenteredText:@"DESCRIÇÃO" inRectangle:CGRectMake(168, 384, 208, 29)];
    [self drawCenteredText:@"V. UNIT." inRectangle:CGRectMake(374, 384, 84, 29)];
    [self drawCenteredText:@"V. TOTAL" inRectangle:CGRectMake(458, 384, 76, 29)];
    
    int numberOfItemLines = 0;
    
    for (PedidoDeProduto *p in sd.currentOrca.productList) {
        
        [self drawItemLineAtY:413+29*numberOfItemLines withItemId:[NSString stringWithFormat:@"%d", numberOfItemLines+1] withQty:[NSString stringWithFormat:@"%@", p.quantidadeProduto] withDescription:[NSString stringWithFormat:@"%@ - %@", p.nomeProduto, p.descricaoProduto] withPPU:[NSString stringWithFormat:@"%@", [p.precoAlterado stringValue]] withPrice:[NSString stringWithFormat:@"%f", [p.precoAlterado floatValue] * [p.quantidadeProduto floatValue]]];
        numberOfItemLines++;
    }
    
    
    [self renderRectangle:CGRectMake(374, 413+29*numberOfItemLines, 160, 37)];
    [self renderRectangle:CGRectMake(374, 413+29*numberOfItemLines, 84, 37)];
    [self drawCenteredText:@"TOTAL" inRectangle:CGRectMake(374, 413+29*numberOfItemLines, 84, 37)];
    [self drawCenteredText:[NSString stringWithFormat:@"%@", sd.currentOrca.resultValue] inRectangle:CGRectMake(458, 413+29*numberOfItemLines, 76, 37)];
    
    /** OBSERVACOES **/
    
    [self renderRectangle:CGRectMake(86, A4_SIZE.size.height-86-97, 451, 97)];
    NSString *obss = @"";
    
    for (NSString *obs in sd.currentOrca.observationList) {
        obss = [NSString stringWithFormat:@"%@Observação - %@\n", obss, obs];
    }
    
    [self drawText:obss inRectangle:CGRectMake(86, A4_SIZE.size.height-86-97, 451, 97)];
    [self renderRectangle:CGRectMake(86, A4_SIZE.size.height-86-97-31, 451, 31)];
    [self drawCenteredText:@"OBSERVAÇÕES" inRectangle:CGRectMake(86, A4_SIZE.size.height-86-97-31, 451, 31)];
    
    
    // Draw a page number at the bottom of each page.
    //currentPage++;
    //[self drawPageNumber:currentPage];
    
    // Render the current page and update the current range to
    // point to the beginning of the next page.
    //currentRange = [self renderPage:currentPage withTextRange:currentRange andFramesetter:framesetter];
    
    // If we're at the end of the text, exit the loop.
    //                if (currentRange.location == CFAttributedStringGetLength((CFAttributedStringRef)currentText))
    //                    done = YES;
    //            } while (!done);
    
    // Close the PDF context and write the contents out.
    UIGraphicsEndPDFContext();
}

-(void)drawItemLineAtY:(int)y withItemId:(NSString *)itemId withQty:(NSString *)qty withDescription:(NSString *)description withPPU:(NSString *)pricePerUnit withPrice:(NSString *)price {
    [self renderRectangle:CGRectMake(86, y, 448, 29)];
    [self renderRectangle:CGRectMake(127, y, 41, 29)];
    [self renderRectangle:CGRectMake(374, y, 84, 29)];
    [self drawCenteredText:itemId inRectangle:CGRectMake(86, y, 41, 29)];
    [self drawCenteredText:qty inRectangle:CGRectMake(127, y, 41, 29)];
    [self drawText:description inRectangle:CGRectMake(168, y, 208, 40)];
    [self drawCenteredText:pricePerUnit inRectangle:CGRectMake(374, y, 84, 29)];
    [self drawCenteredText:price inRectangle:CGRectMake(458, y, 76, 29)];
}

-(NSString *)getPDFFileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    NSString *pdfDirectoryString = [NSString stringWithFormat:@"%@/Orcamento.pdf", documentsDirectoryPath];
    
    NSLog(@"%@", pdfDirectoryString);
    
    return pdfDirectoryString;
    
    //    NSError *error = nil;
    //    if (![YOUR_PDF_DATA writeToFile:pdfDirectoryString options:NSDataWritingAtomic error:&error])
    //        NSLog(@"Error: %@", [error localizedDescription]);
}

// Use Core Text to draw the text in a frame on the page.
- (CFRange)renderPage:(NSInteger)pageNum withTextRange:(CFRange)currentRange
       andFramesetter:(CTFramesetterRef)framesetter
{
    // Get the graphics context.
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
    
    // Put the text matrix into a known state. This ensures
    // that no old scaling factors are left in place.
    CGContextSetTextMatrix(currentContext, CGAffineTransformIdentity);
    
    // Create a path object to enclose the text. Use 72 point
    // margins all around the text.
    CGRect    frameRect = CGRectMake(72, 72, 468, 648);
    CGMutablePathRef framePath = CGPathCreateMutable();
    CGPathAddRect(framePath, NULL, frameRect);
    
    // Get the frame that will do the rendering.
    // The currentRange variable specifies only the starting point. The framesetter
    // lays out as much text as will fit into the frame.
    CTFrameRef frameRef = CTFramesetterCreateFrame(framesetter, currentRange, framePath, NULL);
    CGPathRelease(framePath);
    
    // Core Text draws from the bottom-left corner up, so flip
    // the current transform prior to drawing.
    
    CGContextScaleCTM(currentContext, 1.0, -1.0);
    CGContextTranslateCTM(currentContext, 0, -A4_SIZE.size.height);
    
    CTFrameDraw(frameRef, currentContext);
    
    CGContextTranslateCTM(currentContext, 0, A4_SIZE.size.height);
    CGContextScaleCTM(currentContext, 1.0, -1.0);
    
    // Update the current range based on what was drawn.
    currentRange = CTFrameGetVisibleStringRange(frameRef);
    currentRange.location += currentRange.length;
    currentRange.length = 0;
    CFRelease(frameRef);
    
    return currentRange;
}

- (void)drawPageNumber:(NSInteger)pageNum
{
    NSString *pageString = [NSString stringWithFormat:@"Page %ld", (long)pageNum];
    UIFont *theFont = [UIFont systemFontOfSize:12];
    CGSize maxSize = CGSizeMake(612, 72);
    
    CGSize pageStringSize = [pageString sizeWithFont:theFont
                                   constrainedToSize:maxSize
                                       lineBreakMode:UILineBreakModeClip];
    CGRect stringRect = CGRectMake(((612.0 - pageStringSize.width) / 2.0),
                                   720.0 + ((72.0 - pageStringSize.height) / 2.0),
                                   pageStringSize.width,
                                   pageStringSize.height);
    
    [pageString drawInRect:stringRect withFont:theFont];
}

- (void)drawCenteredText:(NSString *)text inRectangle:(CGRect)rectangle {
    
    UIFont *theFont = [UIFont systemFontOfSize:12];
    CGSize maxSize = rectangle.size;
    
    CGSize pageStringSize = [text sizeWithFont:theFont
                             constrainedToSize:maxSize
                                 lineBreakMode:UILineBreakModeClip];
    CGRect stringRect = CGRectMake(rectangle.origin.x + ((rectangle.size.width - pageStringSize.width) / 2.0),
                                   rectangle.origin.y + ((rectangle.size.height - pageStringSize.height) / 2.0),
                                   pageStringSize.width,
                                   pageStringSize.height);
    
    [text drawInRect:stringRect withFont:theFont];
}

- (void)drawText:(NSString *)text inRectangle:(CGRect)rectangle {
    rectangle = CGRectMake(rectangle.origin.x, A4_SIZE.size.height - rectangle.origin.y - rectangle.size.height, rectangle.size.width, rectangle.size.height);
    
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
    
    CGContextSetTextMatrix(currentContext, CGAffineTransformIdentity);
    
    CFAttributedStringRef currentText = CFAttributedStringCreate(NULL, (CFStringRef)text, NULL);
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(currentText);
    
    CGRect frameRect = rectangle;
    CGMutablePathRef framePath = CGPathCreateMutable();
    CGPathAddRect(framePath, NULL, frameRect);
    
    CTFrameRef frameRef = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), framePath, NULL);
    CGPathRelease(framePath);
    
    CGContextScaleCTM(currentContext, 1.0, -1.0);
    CGContextTranslateCTM(currentContext, 0, -A4_SIZE.size.height);
    
    CTFrameDraw(frameRef, currentContext);
    
    CGContextTranslateCTM(currentContext, 0, A4_SIZE.size.height);
    CGContextScaleCTM(currentContext, 1.0, -1.0);
    
    CFRelease(frameRef);
}

@end
